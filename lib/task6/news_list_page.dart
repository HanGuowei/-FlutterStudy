import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/task6/api/news_api.dart';
import 'package:flutter_study/task6/model/article_info.dart';
import 'package:flutter_study/task6/news_cell.dart';
import 'package:flutter_study/task6/news_detail_page.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class NewsListPage extends StatefulWidget {
  const NewsListPage({super.key});

  @override
  State<NewsListPage> createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {
  List<ArticleInfo> _dataArray = [];
  int _pageIndex = 1;
  final _searchController = TextEditingController(text: 'tesla');
  final RefreshController _refreshController =
    RefreshController(initialRefresh: true);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'please input repo name',
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            suffix: OutlinedButton(
              onPressed: _onRefresh,
              child: const Text(
                'search',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SmartRefresher(
          enablePullUp: true,
          header: const WaterDropHeader(),
          footer: CustomFooter(
            builder: (context, mode) {
              return Container(
                height: 55,
                alignment: Alignment.center,
                child: _footerTipWidget(mode),
              );
            },
          ),
          controller: _refreshController,
          onRefresh: _onRefresh,
          onLoading: _onLoading,
          child: _dataArray.isNotEmpty ? ListView.builder(
            itemCount: _dataArray.length,
            itemBuilder: (context, index) {
              return NewsCell(
                info: _dataArray[index],
                clickCallBack: _pushInfoPage,
              );},
          ) : _emptyWidget(),
        ),
      ),
    );
  }

  Future<void> _onRefresh() async {
    try {
      final result = await NewsApi().getNewsList(
        _searchController.text,
        1,
        20,
      );
      _pageIndex = 2;
      _dataArray.clear();
      setState(() {
        _dataArray = result.articles ?? [];
      });
    } on Exception catch(e) {
      debugPrint(e.toString());
    } finally {
      _refreshController.refreshCompleted();
    }
  }

  Future<void> _onLoading() async {
    try {
      final result = await NewsApi().getNewsList(
        _searchController.text,
        _pageIndex,
        20,
      );
      _pageIndex ++;
      setState(() {
        _dataArray.addAll(result.articles ?? []);
      });
    } on Exception catch(e) {
      debugPrint(e.toString());
    } finally {
      _refreshController.loadComplete();
    }
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

  Widget _footerTipWidget(LoadStatus? mode) {
    return switch(mode) {
    _ when mode == LoadStatus.idle => const Text('pull up load'),
    _ when mode == LoadStatus.loading => const CupertinoActivityIndicator(),
    _ when mode == LoadStatus.failed
    => const Text('Load Failed! Click retry!'),
    _ when mode == LoadStatus.canLoading
    => const Text('release to load more'),
    _ => const Text('No more Data'),};
  }

  Widget _emptyWidget() {
    return const Center(
      child: Text(
        'no data',
      ),
    );
  }
}
