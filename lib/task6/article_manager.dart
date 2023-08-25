import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_study/main.dart';
import 'package:flutter_study/task6/model/article_info.dart';

const kFavorites = 'favorites';

class ArticleManager {
  factory ArticleManager() => _instance;
  ArticleManager._internal();
  static final ArticleManager _instance = ArticleManager._internal();

  List<ArticleInfo> get favoritesArticleArray =>
      sharedPreferences?.getStringList(kFavorites)?.map((e) =>
          ArticleInfo.fromJson(json.decode(e) as Map<String, dynamic>)
        ,).toList() ?? [];

  bool isSave(ArticleInfo info) =>
      favoritesArticleArray.any((element) => element.url == info.url);

  void saveArticle(ArticleInfo info) {
    if (!isSave(info)) {
      final list = favoritesArticleArray
        ..add(info);
      _cacheArticles(list);
    }
  }

  void unSaveArticle(ArticleInfo info) {
    if(isSave(info)) {
      final list = favoritesArticleArray
        ..removeWhere((element) => element.url == info.url);
      _cacheArticles(list);
    }
  }

  void _cacheArticles(List<ArticleInfo> array) {
    final jsonArray = array.map((e) => json.encode(e.toJson())).toList();
    sharedPreferences?.setStringList(kFavorites, jsonArray);
    debugPrint(jsonArray.toString());
  }
}
