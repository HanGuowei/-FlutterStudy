import 'dart:convert';

import 'package:flutter_study/main.dart';
import 'package:flutter_study/task6/entity/article_info.dart';

const _key = 'favorite';

class FavoriteArticles {
  factory FavoriteArticles() {
    return _instance ??= FavoriteArticles._();
  }
  FavoriteArticles._();

  static FavoriteArticles? _instance;

  bool isFavoriteByUrl(String url) =>
      favoriteArticles().any((element) => element.url == url);

  List<ArticleInfo> favoriteArticles() {
    return sharedPreferences!
            .getStringList(_key)
            ?.map(
              (e) =>
                  ArticleInfo.fromJson(json.decode(e) as Map<String, dynamic>),
            )
            .toList() ??
        [];
  }

  Future<bool> favoriteOrNotArticle(ArticleInfo articleInfo) async {
    final list = favoriteArticles();
    if (list.any((element) => element.url == articleInfo.url)) {
      list.removeWhere((element) => element.url == articleInfo.url);
    } else {
      list.add(articleInfo);
    }
    return _storeArticleList(list);
  }

  Future<bool> _storeArticleList(List<ArticleInfo> list) async {
    final jsonList = list.map((e) => json.encode(e.toJson())).toList();
    return sharedPreferences!.setStringList(_key, jsonList);
  }
}
