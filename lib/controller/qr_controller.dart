import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QRController extends GetxController {
  TextEditingController qrContentEditingController = TextEditingController();
  var qrCode = ''.obs;
  var scanResult = ''.obs;
  var history = <Map<String, String>>[].obs;

  @override
  void onInit() {
    super.onInit();
    checkAndRequestCameraPermission();
    loadHistory();
  }

//ask camera permission
  Future<void> checkAndRequestCameraPermission() async {
    if (await Permission.camera.isDenied) {
      await Permission.camera.request();
    }
  }


  void processScannedQRCode(String scannedCode) {
    if (scannedCode.isNotEmpty) {
      scanResult.value = scannedCode;
      saveToHistory(scannedCode);
    }
  }

  void saveToHistory(String result) async {
    final timestamp = DateTime.now().toString();
    final entry = {'data': result, 'time': timestamp};
    history.add(entry);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    final storedHistory = prefs.getStringList('history') ?? [];
    storedHistory.add(jsonEncode(entry));
    await prefs.setStringList('history', storedHistory);
  }

  void loadHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final storedHistory = prefs.getStringList('history') ?? [];
    history.assignAll(
      storedHistory.map((item) => jsonDecode(item) as Map<String, String>),
    );
  }

  void clearHistory() async {
    history.clear();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('history');
  }
}
