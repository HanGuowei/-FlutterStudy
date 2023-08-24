import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'web_view_page.dart';

const amazonUrl = 'https://www.amazon.co.jp/dp/';

class ScannerPage extends StatefulWidget {
  const ScannerPage({super.key});

  @override
  State<ScannerPage> createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('task 4',),
      ),
      body: MobileScanner(
        onDetect: (capture) => _checkBarcodes(capture.barcodes),
      ),
    );
  }

  void _checkBarcodes(List<Barcode> barcodes) {
    if (barcodes.isEmpty) {
      return;
    }

    final barcodeStr = barcodes.first.rawValue;

    if (barcodeStr == null || barcodeStr.isEmpty) {
      return;
    }

    final url = '$amazonUrl${_convertIsbn13ToIsbn10(barcodeStr)}';
    final title = 'ISBN:$barcodeStr';
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

  // convert ISBN13 to ISBN10, if ISBN13 is not 13 digits,
  // return ISBN13 as it is.
  String _convertIsbn13ToIsbn10(String isbn13) {
    const isbn13Count = 13;
    const subStringStart = 3;
    const subStringEnd = 12;
    const remainder = 11;

    if (isbn13.length != isbn13Count) {
      return isbn13;
    }
    final digits = isbn13.substring(subStringStart, subStringEnd).split('');
    final sum = digits.asMap().entries.fold(
      0,
          (previousValue, element) =>
      previousValue + int.parse(element.value) * (10 - element.key),
    );
    final checkDigit = remainder - sum % remainder;
    final isbn10 = isbn13.substring(subStringStart, subStringEnd)
        + checkDigit.toString();
    return isbn10;
  }
}
