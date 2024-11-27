import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QRController extends GetxController {
  TextEditingController qrContentEditingController = TextEditingController();
  var qrCode = ''.obs;
  var scanResult = ''.obs;
  var history = <Map<String, String>>[].obs;
  var isSnackBarVisible = false.obs; // Flag to prevent multiple SnackBars

  @override
  void onInit() {
    super.onInit();
    checkAndRequestCameraPermission();
    loadHistory();
  }

  // Request camera permission
  Future<void> checkAndRequestCameraPermission() async {
    if (await Permission.camera.isDenied) {
      await Permission.camera.request();
    }
  }
 
  // Process scanned QR code
  void processScannedQRCode(String scannedCode) {
    if (scannedCode.isNotEmpty && scanResult.value != scannedCode) {
      scanResult.value = scannedCode;
      saveToHistory(scannedCode);
      showSnackBarWithCopyOption(scannedCode);
    }
  }

  // Save scanned code to history
  void saveToHistory(String result) async {
    final timestamp = DateTime.now().toString();
    final entry = {'data': result, 'time': timestamp};
    history.add(entry);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    final storedHistory = prefs.getStringList('history') ?? [];
    storedHistory.add(jsonEncode(entry));
    await prefs.setStringList('history', storedHistory);
  }

  // Load history from shared preferences
  void loadHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final storedHistory = prefs.getStringList('history') ?? [];
    history.assignAll(
      storedHistory.map((item) => jsonDecode(item) as Map<String, String>),
    );
  }

  // Clear history
  void clearHistory() async {
    history.clear();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('history');
  }

  void showSnackBarWithCopyOption(String message) {
    if (isSnackBarVisible.value) return; // Prevent multiple SnackBars

    isSnackBarVisible.value = true;
    Get.snackbar(
      "Scanned QR Code",
      message,
      snackPosition: SnackPosition.BOTTOM,
      mainButton: TextButton(
        onPressed: () {
          Clipboard.setData(ClipboardData(text: message));
          Get.snackbar("Copied", "The scanned result has been copied!");
        },
        child: const Text(
          "COPY",
          style: TextStyle(
              color: Colors.amber, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      snackbarStatus: (status) {
        if (status == SnackbarStatus.CLOSED) {
          isSnackBarVisible.value = false; // Reset the flag
        }
      },
    );
  }
}
