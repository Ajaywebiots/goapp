import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:permission_handler/permission_handler.dart';

class QRScannerScreen extends StatefulWidget {
  const QRScannerScreen({super.key});

  @override
  State<QRScannerScreen> createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  String? scannedData;
  bool isCameraReady = false;
  bool hasScanned = false;

  @override
  void initState() {
    super.initState();
    initCamera();
  }

  Future<void> initCamera() async {
    final status = await Permission.camera.request();
    if (status.isGranted) {
      setState(() => isCameraReady = true);
    } else {
      openAppSettings(); // Optional: send user to settings
    }
  }

  void onDetect(BarcodeCapture capture) {
    if (hasScanned) return; // Prevent multiple scans

    final barcode = capture.barcodes.first;
    final code = barcode.rawValue;

    if (code != null) {
      setState(() {
        scannedData = code;
        hasScanned = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: isCameraReady
            ? Column(children: [
                Expanded(flex: 3, child: MobileScanner(onDetect: onDetect)),
                if (scannedData != null)
                  Expanded(
                      flex: 1,
                      child: Container(
                          width: double.infinity,
                          color: Colors.black12,
                          padding: const EdgeInsets.all(16),
                          child: Text('Scanned Data: $scannedData',
                              style: const TextStyle(fontSize: 16))))
              ])
            : const Center(child: CircularProgressIndicator()));
  }
}
