import 'package:flutter/material.dart';
import 'package:flutter_study/task6/entity/article_info.dart';
import 'package:flutter_study/task6/favorite_store_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetailScreen extends ConsumerStatefulWidget {
  const NewsDetailScreen({super.key, required this.article});

  final ArticleInfo article;

  @override
  ConsumerState<NewsDetailScreen> createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends ConsumerState<NewsDetailScreen> {
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
          _favoriteIconBuild(),
        ],
      ),
      body: WebViewWidget(controller: _webViewController),
    );
  }

  Widget _favoriteIconBuild() {
    final favoriteArticles = ref.watch(favoriteStoreProvider);
    final model = ref.read(favoriteStoreProvider.notifier);
    if (favoriteArticles.any((element) => element.url == widget.article.url)) {
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
    ;
  }
}
