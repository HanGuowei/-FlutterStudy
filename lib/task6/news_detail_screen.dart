import 'package:flutter/material.dart';
import 'package:flutter_study/task6/entity/article_bean.dart';
import 'package:flutter_study/task6/favorite_store_model.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetailScreen extends StatefulWidget {
  const NewsDetailScreen({super.key, required this.article});

  final ArticlesBean article;

  @override
  State<NewsDetailScreen> createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  final _webViewController = WebViewController();

  @override
  void initState() {
    _webViewController.loadRequest(Uri.parse(widget.article.url));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.article.title),
        actions: [
          Consumer<FavoriteStoreModel>(
            builder: (context, model, child) {
              if (model.storedList
                  .any((element) => element.url == widget.article.url)) {
                return IconButton(
                  onPressed: () {
                    model.removeItem(widget.article);
                  },
                  icon: const Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                );
              } else {
                return IconButton(
                  onPressed: () {
                    model.addItem(widget.article);
                  },
                  icon: const Icon(Icons.favorite),
                );
              }
            },
          )
        ],
      ),
      body: WebViewWidget(controller: _webViewController),
    );
  }
}
