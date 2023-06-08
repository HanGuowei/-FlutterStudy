import 'package:flutter/material.dart';
import 'package:flutter_study/task6/article.dart';
import 'package:flutter_study/task6/favorite_store_model.dart';
import 'package:provider/provider.dart';

import 'entity/article_bean.dart';
import 'news_detail_screen.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Favorite'),
      ),
      body: Consumer<FavoriteStoreModel>(
        builder: (context, model, child) {
          final articles = model.storedList;
          return ListView.builder(
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
          );
        },
      ),
    );
  }

  void _navigationToDetail(ArticlesBean article) {
    Navigator.of(context).push(
      MaterialPageRoute<NewsDetailScreen>(
        builder: (context) => NewsDetailScreen(
          article: article,
        ),
      ),
    );
  }
}
