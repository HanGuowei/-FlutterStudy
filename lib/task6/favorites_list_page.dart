import 'package:flutter/material.dart';
import 'package:flutter_study/task6/article_manager.dart';
import 'package:flutter_study/task6/empty_widget.dart';
import 'package:flutter_study/task6/model/article_info.dart';
import 'package:flutter_study/task6/news_cell.dart';
import 'package:flutter_study/task6/news_detail_page.dart';

class FavoritesListPage extends StatefulWidget {
  const FavoritesListPage({super.key});

  @override
  State<FavoritesListPage> createState() => _FavoritesListPageState();
}

class _FavoritesListPageState extends State<FavoritesListPage> {
  List<ArticleInfo> favoritesArray = [];

  @override
  Widget build(BuildContext context) {
    _updateData();
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

  Future<void> _pushInfoPage(ArticleInfo info) async {
    await Navigator.of(context).push(
      MaterialPageRoute<NewsDetailPage>(builder: (_) =>
          NewsDetailPage(
            articleInfo: info,
          ),
      ),
    );
    setState(_updateData);
  }

  void _updateData() {
    favoritesArray = ArticleManager().favoritesArticleArray;
  }
}
