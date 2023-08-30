import 'package:flutter/material.dart';
import 'package:flutter_study/task6/article_manager.dart';
import 'package:flutter_study/task6/model/article_info.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetailPage extends StatefulWidget {
  const NewsDetailPage({
    super.key,
    required this.articleInfo,
  });

  final ArticleInfo articleInfo;

  @override
  State<StatefulWidget> createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  final _controller = WebViewController();

  @override
  void initState() {
    _controller.loadRequest(
      Uri.parse(
        widget.articleInfo.url ?? '',
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.articleInfo.title ?? '',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _changeState,
        child: Icon(
          ArticleManager().isSave(widget.articleInfo)
              ? Icons.favorite
              : Icons.favorite_border,
        ),
      ),
      body: WebViewWidget(
        controller: _controller,
      ),
    );
  }

  void _changeState() {
    final isSave = ArticleManager().isSave(widget.articleInfo,);
    if (isSave) {
      ArticleManager().unSaveArticle(widget.articleInfo,);
    } else {
      ArticleManager().saveArticle(widget.articleInfo,);
    }
    setState(() {

    });
  }
}
