import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AmazonResultScreen extends StatefulWidget {
  const AmazonResultScreen({super.key, required this.isbn});

  final String isbn;

  @override
  State<AmazonResultScreen> createState() => _AmazonResultScreenState();
}

class _AmazonResultScreenState extends State<AmazonResultScreen> {
  final webViewController = WebViewController();

  @override
  void initState() {
    webViewController.loadRequest(
      Uri.parse(
          'https://www.amazon.co.jp/dp/${_convertIsbn13ToIsbn10(widget.isbn)}'),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ISBN:${widget.isbn}'),
            if (widget.isbn.length == 13)
              Text(
                'convert to ISBN10:${_convertIsbn13ToIsbn10(widget.isbn)}',
                style: Theme.of(context).textTheme.labelSmall,
              )
          ],
        ),
      ),
      body: WebViewWidget(controller: webViewController),
    );
  }

  // convert ISBN13 to ISBN10, if ISBN13 is not 13 digits,
  // return ISBN13 as it is.
  String _convertIsbn13ToIsbn10(String isbn13) {
    if (isbn13.length != 13) {
      return isbn13;
    }
    final digits = isbn13.substring(3, 12).split('');
    var sum = 0;
    for (var i = 0; i < digits.length; i++) {
      final digit = int.parse(digits[i]);
      sum += digit * (10 - i);
    }
    final checkDigit = 11 - sum % 11;
    final isbn10 = isbn13.substring(3, 12) + checkDigit.toString();
    return isbn10;
  }
}
