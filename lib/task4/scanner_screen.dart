import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import 'amazon_result_screen.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  List<Barcode> _scanResultListForBarcode = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task 4: Book Barcode Scan'),
      ),
      body: Stack(
        children: [
          MobileScanner(
            onDetect: (capture) {
              _checkAndAddToList(capture.barcodes);
            },
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ListView.separated(
                reverse: true,
                itemCount: _scanResultListForBarcode.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  return buildBarcodeResultItem(index);
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildBarcodeResultItem(int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<AmazonResultScreen>(
            builder: (context) => AmazonResultScreen(
              isbn: _scanResultListForBarcode.elementAt(index).rawValue!,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _scanResultListForBarcode.elementAt(index).rawValue.toString(),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.arrow_forward),
                Text(
                  'Amazon',
                  style: Theme.of(context).textTheme.labelSmall,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void _checkAndAddToList(List<Barcode> barcodes) {
    final regex10 = RegExp(r'^\d{9}[\d|X]$');
    final regex13 = RegExp(r'^\d{13}$');
    barcodes
      ..retainWhere((element) {
        if (element.rawValue == null) {
          return false;
        }
        return regex10.hasMatch(element.rawValue!) ||
            regex13.hasMatch(element.rawValue!);
      })
      ..sort((a, b) {
        if (a.rawValue == null || b.rawValue == null) {
          return 0;
        }
        return a.rawValue!.compareTo(b.rawValue!);
      });
    if (_scanResultListForBarcode != barcodes) {
      setState(() {
        _scanResultListForBarcode = barcodes;
      });
    }
  }
}
