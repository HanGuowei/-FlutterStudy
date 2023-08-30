import 'dart:convert';
import 'package:flutter_study/main.dart';
import 'package:flutter_study/task7/model/article_info.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'article_notifier.g.dart';

const kFavorites = 'favorites';

@riverpod
bool isFavorites(IsFavoritesRef ref, {required ArticleInfo info}) {
  final articles = ref.watch(articleNotifierProvider);
  return articles.any((element) =>
    element.url == info.url && element.title == info.title,);
}

@riverpod
class ArticleNotifier extends _$ArticleNotifier {

  @override
  List<ArticleInfo> build() {
    return sharedPreferences?.getStringList(kFavorites)?.map((e) =>
        ArticleInfo.fromJson(json.decode(e) as Map<String, dynamic>)
      ,).toList() ?? [];
  }

  bool isSave(ArticleInfo info) =>
      state.any((element) =>
        element.url == info.url && element.title == info.title,);

  void saveArticle(ArticleInfo info) {
    if (!isSave(info)) {
      final list = [...state, info];
      _cacheArticles(list);
    }
  }

  void unSaveArticle(ArticleInfo info) {
    if(isSave(info)) {
      final list = [
        for (final model in state)
          if (model.url != info.url) model,
      ];
      _cacheArticles(list);
    }
  }

  void _cacheArticles(List<ArticleInfo> array) {
    final jsonArray = array.map((e) => json.encode(e.toJson())).toList();
    sharedPreferences?.setStringList(kFavorites, jsonArray);
    state = array;
  }
}
