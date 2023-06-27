import 'package:flutter/material.dart';
import 'package:flutter_study/task6/article.dart';

import 'entity/article_info.dart';
import 'favorite_articles.dart';
import 'news_detail_screen.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<ArticleInfo> articles = [];

  @override
  void initState() {
    super.initState();
    _reloadFavoriteArticles();
  }

  @override
  Widget build(BuildContext context) {
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

  Future<void> _navigationToDetail(ArticleInfo article) async {
    await Navigator.of(context).push(
      MaterialPageRoute<NewsDetailScreen>(
        builder: (context) => NewsDetailScreen(
          article: article,
        ),
      ),
    );
    _reloadFavoriteArticles();
  }

  void _reloadFavoriteArticles() {
    setState(() {
      articles = FavoriteArticles().favoriteArticles();
    });
  }
}
