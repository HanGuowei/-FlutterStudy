import 'package:flutter/material.dart';
import 'package:flutter_study/task6/api/news_api.dart';
import 'package:flutter_study/task6/model/article_bean.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  o

  final NewsApi _newsApi = NewsApi();
  int _currentPage = 1;
  bool _isMoreLoading = false;
  final List<ArticlesBean> _articles = [];

  final _searchController = TextEditingController();

  // ', searchIn, sources, from, to, language, page, pageSize
  final List<SearchIn> searchIn = [
    SearchIn.title,
    SearchIn.description,
    SearchIn.content
  ];
  final String sources = '';
  final DateTime from = DateTime.now();
  final DateTime to = DateTime.now();
  final Language language = Language.en;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _filterBarBuild(),
        // _newsListBuild(),
      ],
    );
  }

  Widget _filterBarBuild() {
    final statusBarHeight = MediaQuery
        .of(context)
        .padding
        .top;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: statusBarHeight),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Keyword Search',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: _searchController.clear,
                ),
                prefixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    // Perform the search here
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _newsListBuild() {
    return RefreshIndicator(
      child: ListView.builder(
        itemCount: _articles.length + 1,
        itemBuilder: (context, index) {
          if (index < _articles.length) {
            return const Text('article');
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
        },
      ),
      onRefresh: () async {
        // return null;
      },
    );
  }

// Future<void> _loadMoreNews() async {
//   final issues = await _newsApi.everything(
//       'flutter',
//       searchIn,
//       sources,
//       from,
//       to,
//       language,
//       page,
//       pageSize)
//   _currentIssuePage++;
//   setState(() {
//     _issues.addAll(issues);
//   });
// }
}
