import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/task5/api/github_api.dart';
import 'package:flutter_study/task5/model/repository_search_result.dart';
import 'package:flutter_study/task5/repository_info_page.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class RepositoryListPage extends StatefulWidget {
  const RepositoryListPage({super.key});

  @override
  State<RepositoryListPage> createState() => _RepositoryListPageState();
}

class _RepositoryListPageState extends State<RepositoryListPage> {
  List<RepositoryInfo> _dataArray = [];
  int _pageIndex = 1;
  final _searchController = TextEditingController(text: 'HanGuowei/FlutterStudy');
  final RefreshController _refreshController = RefreshController();

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
        child: _dataArray.isNotEmpty ? SmartRefresher(
          enablePullUp: true,
          header: const WaterDropHeader(),
          footer: CustomFooter(
            builder: (context, mode) {
              return SizedBox(
                height: 55,
                child: Center(
                  child: _footerTipWidget(mode),
                ),);
            },
          ),
          controller: _refreshController,
          onRefresh: _onRefresh,
          onLoading: _onLoading,
          child: ListView.builder(
            itemCount: _dataArray.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(_dataArray[index].name ?? ''),
                onTap: () => _pushInfoPage(_dataArray[index].fullName),
              );},
          ),
        ) : _emptyWidget(),
      ),
    );
  }

  Future<void> _onRefresh() async {
    try {
      final result = await GithubApi().searchRepository(
        _searchController.text,
        1,
        20,
      );
      _pageIndex = 2;
      _dataArray.clear();
      setState(() {
        _dataArray = result.items;
      });
    } on Exception catch(e) {
      debugPrint(e.toString());
    } finally {
      _refreshController.refreshCompleted();
    }
  }

  Future<void> _onLoading() async {
    try {
      final result = await GithubApi().searchRepository(
        _searchController.text,
        _pageIndex,
        20,
      );
      _pageIndex ++;
      setState(() {
        _dataArray.addAll(result.items);
      });
    } on Exception catch(e) {
      debugPrint(e.toString());
    } finally {
      _refreshController.loadComplete();
    }
  }

  void _pushInfoPage(String? fullName) {
    Navigator.of(context).push(
      MaterialPageRoute<RepositoryInfoPage>(builder: (_) =>
          RepositoryInfoPage(fullName: fullName ?? ''),
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
      _ => const Text('No more Data'),
    };
  }

  Widget _emptyWidget() {
    return const Center(
      child: Text(
        'no data',
      ),
    );
  }
}
