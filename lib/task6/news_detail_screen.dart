import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_study/task6/entity/article_info.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'favorite_articles.dart';

class NewsDetailScreen extends ConsumerStatefulWidget {
  const NewsDetailScreen({super.key, required this.article});

  final ArticleInfo article;

  @override
  ConsumerState<NewsDetailScreen> createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends ConsumerState<NewsDetailScreen> {
  final _webViewController = WebViewController();
  bool isFavorite = false;

  @override
  void initState() {
    _initFavorite();
    _webViewController.loadRequest(Uri.parse(widget.article.url));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.article.title),
        actions: [
          isFavorite
              ? IconButton(
                  onPressed: _clickFavorite,
                  icon: const Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                )
              : IconButton(
                  onPressed: _clickFavorite,
                  icon: const Icon(Icons.favorite),
                )
        ],
      ),
      body: WebViewWidget(controller: _webViewController),
    );
  }

  Future<void> _clickFavorite() async {
    await FavoriteArticles().favoriteOrNotArticle(widget.article);
    await _initFavorite();
  }

  Future<void> _initFavorite() async {
    setState(() {
      isFavorite = FavoriteArticles().isFavoriteByUrl(widget.article.url);
    });
  }
}
