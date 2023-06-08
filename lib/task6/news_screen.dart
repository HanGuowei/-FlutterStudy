import 'package:flutter/material.dart';
import 'package:flutter_study/task6/api/news_api.dart';
import 'package:flutter_study/task6/article.dart';
import 'package:flutter_study/task6/entity/article_bean.dart';
import 'package:flutter_study/task6/news_detail_screen.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final NewsApi _newsApi = NewsApi();
  int _currentPage = 1;
  bool _isMoreLoading = false;
  bool _isMaxResult = false;
  final List<ArticlesBean> _articles = [];
  final _searchController = TextEditingController();
  final _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _filterBarBuild(),
        Expanded(
          child: _newsListBuild(context),
        )
      ],
    );
  }

  Widget _filterBarBuild() {
    final statusBarHeight = MediaQuery.of(context).padding.top;
    return Padding(
      padding: EdgeInsets.only(top: statusBarHeight),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Keyword Search',
            suffixIcon: IconButton(
              icon: const Icon(Icons.search),
              onPressed: _search,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
    );
  }

  Widget _newsListBuild(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _search,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        controller: _scrollController,
        itemCount: _articles.length + 1,
        itemBuilder: (context, index) {
          if (index < _articles.length) {
            return Article(
              onTap: () {
                _navigationToDetail(_articles[index]);
              },
              articlesBean: _articles[index],
            );
          } else {
            if (_isMaxResult) {
              return const Text('No more articles');
            } else {
              if (_isMoreLoading) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                return null;
              }
            }
          }
        },
      ),
    );
  }

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      // 滚动到列表底部触发加载更多
      if (!_isMoreLoading) {
        setState(() {
          _isMoreLoading = true;
        });
        _loadMoreNews();
      }
    }
  }

  Future<void> _loadMoreNews() async {
    try {
      final news = await _newsApi.everything(
        _searchController.text,
        _currentPage,
        20,
      );
      _currentPage++;
      setState(() {
        _articles.addAll(news.articles);
        _isMoreLoading = false;
      });
    } on Exception catch (_) {
      setState(() {
        _isMoreLoading = false;
        _isMaxResult = true;
      });
    }
  }

  Future<void> _search() {
    setState(() {
      _currentPage = 1;
      _articles.clear();
      _isMoreLoading = true;
      _isMaxResult = false;
    });
    _loadMoreNews();
    return Future(() => null);
  }

  void _navigationToDetail(ArticlesBean article) {
    Navigator.of(context).push(
      MaterialPageRoute<NewsDetailScreen>(
        builder: (context) => NewsDetailScreen(
          article: article,
        ),
      ),
    );
  }
}
