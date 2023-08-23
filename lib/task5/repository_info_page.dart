import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/task5/api/github_api.dart';
import 'package:flutter_study/task5/model/repository_issues_info.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class RepositoryInfoPage extends StatefulWidget {
  const RepositoryInfoPage({
    super.key,
    required this.fullName,
  });

  final String fullName;

  @override
  State<RepositoryInfoPage> createState() => _RepositoryInfoPageState();
}

class _RepositoryInfoPageState extends State<RepositoryInfoPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.fullName,
          ),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Readme.md',),
              Tab(text: 'Issues',),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _ReadmeView(
              fullName: widget.fullName,
            ),
            _IssuesView(
              fullName: widget.fullName,
            ),
          ],
        ),
      ),
    );
  }
}

class _ReadmeView extends StatefulWidget {
  const _ReadmeView({
    required this.fullName,
  });
  final String fullName;

  @override
  _ReadmeViewState createState() => _ReadmeViewState();
}

class _ReadmeViewState extends State<_ReadmeView> {
  String _content = '';

  @override
  void initState() {
    _getReadmeData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text(_content),
      ],
    );
  }

  Future<void> _getReadmeData() async {
    try {
      final info = await GithubApi().getRepositoryReadme(widget.fullName);
      final readmeContent = info.content ?? '';
      setState(() {
        _content = utf8.decode(
          base64.decode(readmeContent.replaceAll(RegExp(r'\s'), '')),
        );
      });
    } on Exception catch(e) {
      debugPrint(e.toString());
    }
  }
}

class _IssuesView extends StatefulWidget {
  const _IssuesView({
    required this.fullName,
  });
  final String fullName;

  @override
  _IssuesViewState createState() => _IssuesViewState();
}

class _IssuesViewState extends State<_IssuesView> {
  List<RepositoryIssuesInfo> _dataArray = [];
  int _pageIndex = 1;
  final RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    _onRefresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _dataArray.isNotEmpty ? SmartRefresher(
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
            title: Text(_dataArray[index].title ?? ''),
          );},
      ),
    ) : _emptyWidget();
  }

  Future<void> _onRefresh() async {
    try {
      final list = await GithubApi().getRepositoryIssues(
        widget.fullName,
        1,
        20,
      );
      _pageIndex = 2;
      _dataArray.clear();
      setState(() {
        _dataArray = list;
      });
    } on Exception catch(e) {
      debugPrint(e.toString());
    } finally {
      _refreshController.refreshCompleted();
    }
  }

  Future<void> _onLoading() async {
    try {
      final list = await GithubApi().getRepositoryIssues(
        widget.fullName,
        _pageIndex,
        20,
      );
      _pageIndex ++;
      setState(() {
        _dataArray.addAll(list);
      });
    } on Exception catch(e) {
      debugPrint(e.toString());
    } finally {
      _refreshController.loadComplete();
    }
  }

  Widget _footerTipWidget(LoadStatus? mode) {
    return switch(mode) {
    _ when mode == LoadStatus.idle => const Text('pull up load'),
    _ when mode == LoadStatus.loading => const CupertinoActivityIndicator(),
    _ when mode == LoadStatus.failed => const Text('Load Failed! Click retry!'),
    _ when mode == LoadStatus.canLoading => const Text('release to load more'),
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
