import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_study/task6/entity/article_info.dart';
import 'package:flutter_study/task6/favorite_store_model.dart';
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
    final favoriteArticles = ref.watch(favoriteArticlesProvider);
    final favoriteArticlesNotifier =
        ref.read(favoriteArticlesProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.article.title),
        actions: [
          (favoriteArticles.any((element) => element.url == widget.article.url))
              ? IconButton(
                  onPressed: () {
                    favoriteArticlesNotifier.removeItem(widget.article);
                  },
                  icon: const Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                )
              : IconButton(
                  onPressed: () {
                    favoriteArticlesNotifier.addItem(widget.article);
                  },
                  icon: const Icon(Icons.favorite),
                )
        ],
      ),
      body: WebViewWidget(controller: _webViewController),
    );
  }
}
