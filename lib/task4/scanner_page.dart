import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'web_view_page.dart';

const amazonUrl = 'https://www.amazon.co.jp/dp/';

class ScannerPage extends StatefulWidget {
  const ScannerPage({super.key});

  @override
  _ScannerPageState createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('task 4'),
      ),
      body: MobileScanner(
        onDetect: (capture) => _checkBarcodes(capture.barcodes),
      ),
    );
  }

  void _checkBarcodes(List<Barcode> barcodes) {
    if (barcodes.isEmpty) return;

    final String? barcodeStr = barcodes.first.rawValue;

    if (barcodeStr != null && barcodeStr.isNotEmpty) {
      final url = '${amazonUrl}${_convertIsbn13ToIsbn10(barcodeStr)}';
      final title = 'ISBN:${barcodeStr}';
      Navigator.push(
        context,
        MaterialPageRoute<WebViewPage>(
          builder: (context) => WebViewPage(
            requestUrl: url,
            requestTitle: title,
          ),
        ),
      );
    }
  }

  // convert ISBN13 to ISBN10, if ISBN13 is not 13 digits,
  // return ISBN13 as it is.
  String _convertIsbn13ToIsbn10(String isbn13) {
    if (isbn13.length != 13) {
      return isbn13;
    }
    final digits = isbn13.substring(3, 12).split('');
    final sum = digits.asMap().entries.fold(
      0,
          (previousValue, element) =>
      previousValue + int.parse(element.value) * (10 - element.key),
    );
    final checkDigit = 11 - sum % 11;
    final isbn10 = isbn13.substring(3, 12) + checkDigit.toString();
    return isbn10;
  }
}