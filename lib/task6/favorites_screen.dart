import 'package:flutter/material.dart';
import 'package:flutter_study/task6/article.dart';
import 'package:flutter_study/task6/favorite_store_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'entity/article_info.dart';
import 'news_detail_screen.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final articles = ref.watch(favoriteStoreProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Favorite'),
      ),
      body: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          final article = articles[index];
          return Article(
            onTap: () {
              _navigationToDetail(context, article);
            },
            articlesBean: article,
          );
        },
      ),
    );
  }

  void _navigationToDetail(BuildContext context, ArticleInfo article) {
    Navigator.of(context).push(
      MaterialPageRoute<NewsDetailScreen>(
        builder: (context) => NewsDetailScreen(
          article: article,
        ),
      ),
    );
  }
}
