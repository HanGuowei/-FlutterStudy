import 'dart:convert';

import 'package:flutter_study/task6/entity/article_info.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'favorite_articles.g.dart';

const _key = 'favorite';

@riverpod
Future<SharedPreferences> getSharedPreferences(
  GetSharedPreferencesRef ref,
) async {
  return SharedPreferences.getInstance();
}

@riverpod
class FavoriteArticles extends _$FavoriteArticles {
  @override
  List<ArticleInfo> build() {
    final prefs = ref.watch(getSharedPreferencesProvider);
    final list = prefs.value
            ?.getStringList(_key)
            ?.map(
              (e) =>
                  ArticleInfo.fromJson(json.decode(e) as Map<String, dynamic>),
            )
            .toList() ??
        [];
    return list;
  }

  Future<void> _storeArticleList(List<ArticleInfo> list) async {
    final value = list.map((e) => json.encode(e.toJson())).toList();
    final isSuccess = await ref
        .watch(getSharedPreferencesProvider)
        .value
        ?.setStringList(_key, value);
    if (isSuccess != null && isSuccess) {
      state = list;
    }
  }

  Future<void> addItem(ArticleInfo article) async {
    if (!state.any((element) => element.url == article.url)) {
      final newList = [...state, article];
      await _storeArticleList(newList);
    }
  }

  Future<void> removeItem(ArticleInfo article) async {
    final newList = [
      for (final t in state)
        if (t.url != article.url) t
    ];
    await _storeArticleList(newList);
  }
}
