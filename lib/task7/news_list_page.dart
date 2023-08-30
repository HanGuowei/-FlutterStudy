import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_study/task6/empty_widget.dart';
import 'package:flutter_study/task7/controller/article_list_notifier.dart';
import 'package:flutter_study/task7/model/article_info.dart';
import 'package:flutter_study/task7/news_cell.dart';
import 'package:flutter_study/task7/news_detail_page.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class NewsListPage extends ConsumerStatefulWidget {
  const NewsListPage({super.key});

  @override
  ConsumerState<NewsListPage> createState() => _NewsListPageState();
}

class _NewsListPageState extends ConsumerState<NewsListPage> {
  final _searchController = TextEditingController(text: '');

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final articles = ref.watch(articleListNotifierProvider);
    final articleListNotifier = ref.watch(articleListNotifierProvider.notifier);
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
              onPressed: () =>
                  articleListNotifier.refreshItems(_searchController.text),
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
          controller: articleListNotifier.refreshController,
          onRefresh: () =>
              articleListNotifier.refreshItems(_searchController.text),
          onLoading: () =>
              articleListNotifier.loadMoreItems(_searchController.text),
          child: articles.items.isNotEmpty ? ListView.builder(
            itemCount: articles.items.length,
            itemBuilder: (context, index) {
              return NewsCell(
                info: articles.items[index],
                clickCallBack: _pushInfoPage,
              );},
          ) : const EmptyWidget(),
        ),
      ),
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
}
