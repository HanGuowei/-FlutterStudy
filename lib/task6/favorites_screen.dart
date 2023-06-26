import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_study/task6/article.dart';

import 'entity/article_info.dart';
import 'favorite_articles.dart';
import 'news_detail_screen.dart';

class FavoritesScreen extends ConsumerStatefulWidget {
  const FavoritesScreen({super.key});

  @override
  ConsumerState<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends ConsumerState<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    final articles = ref.watch(favoriteArticlesProvider);
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
              _navigationToDetail(article);
            },
            articlesBean: article,
          );
        },
      ),
    );
  }

  void _navigationToDetail(ArticleInfo article) {
    Navigator.of(context).push(
      MaterialPageRoute<NewsDetailScreen>(
        builder: (context) => NewsDetailScreen(
          article: article,
        ),
      ),
    );
  }
}
