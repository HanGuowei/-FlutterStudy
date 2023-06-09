import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_study/task6/entity/article_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteStoreModel extends ChangeNotifier {
  late SharedPreferences preferences;
  static const key = 'favorite';

  List<ArticleInfo> get storedList =>
      preferences
          .getStringList(key)
          ?.map(
            (e) => ArticleInfo.fromJson(json.decode(e) as Map<String, dynamic>),
          )
          .toList() ??
      [];

  Future<void> _storeArticleList(List<ArticleInfo> list) async {
    final value = list.map((e) => json.encode(e.toJson())).toList();
    await preferences.setStringList(key, value);
  }

  Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  Future<void> addItem(ArticleInfo article) async {
    final origin = storedList;
    if (!origin.any((element) => element.url == article.url)) {
      origin.add(article);
    }
    await _storeArticleList(origin);
    notifyListeners();
  }

  Future<void> removeItem(ArticleInfo article) async {
    final origin = storedList
      ..removeWhere((element) => element.url == article.url);
    await _storeArticleList(origin);
    notifyListeners();
  }
}
