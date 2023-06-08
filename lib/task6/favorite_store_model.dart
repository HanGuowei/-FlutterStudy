import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_study/task6/entity/article_bean.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteStoreModel extends ChangeNotifier {
  late SharedPreferences preferences;
  final key = 'favorite';

  List<ArticlesBean> get storedList =>
      preferences
          .getStringList(key)
          ?.map((e) =>
              ArticlesBean.fromJson(json.decode(e) as Map<String, dynamic>))
          .toList() ??
      [];

  Future<void> _storeArticleList(List<ArticlesBean> list) async {
    final value = list.map((e) => json.encode(e.toJson())).toList();
    await preferences.setStringList(key, value);
  }

  Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  Future<void> addItem(ArticlesBean article) async {
    final origin = storedList;
    if (!origin.any((element) => element.url == article.url)) {
      origin.add(article);
    }
    await _storeArticleList(origin);
    notifyListeners();
  }

  Future<void> removeItem(ArticlesBean article) async {
    final origin = storedList
      ..removeWhere((element) => element.url == article.url);
    await _storeArticleList(origin);
    notifyListeners();
  }
}
