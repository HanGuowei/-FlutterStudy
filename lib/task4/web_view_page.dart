import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({
    super.key,
    required this.requestUrl,
    this.requestTitle = '',
  });

  final String requestUrl;
  final String requestTitle;

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  final _controller = WebViewController();

  @override
  void initState() {
    _controller.loadRequest(
      Uri.parse(
        widget.requestUrl,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.requestTitle,
        ),
      ),
      body: WebViewWidget(
        controller: _controller,
      ),
    );
  }
}
