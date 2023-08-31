import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_study/task6/empty_widget.dart';
import 'package:flutter_study/task7/controller/article_notifier.dart';
import 'package:flutter_study/task7/model/article_info.dart';
import 'package:flutter_study/task7/news_cell.dart';
import 'package:flutter_study/task7/news_detail_page.dart';

class FavoritesListPage extends ConsumerStatefulWidget {
  const FavoritesListPage({super.key});

  @override
  ConsumerState<FavoritesListPage> createState() => _FavoritesListPageState();
}

class _FavoritesListPageState extends ConsumerState<FavoritesListPage> {

  @override
  Widget build(BuildContext context) {
    final favoritesArray = ref.watch(articleNotifierProvider);
    return SafeArea(
      child: favoritesArray.isNotEmpty
          ? ListView.builder(
              itemCount: favoritesArray.length,
              itemBuilder: (context, index) {
                return NewsCell(
                  info: favoritesArray[index],
                  clickCallBack: _pushInfoPage,
                );},
      )
          : const EmptyWidget(),
    );
  }

  void _pushInfoPage(ArticleInfo info) {
    Navigator.of(context).push(
      MaterialPageRoute<NewsDetailPage>(builder: (_) =>
          NewsDetailPage(
            articleInfo: info,
          ),
      ),
    );
  }
}
