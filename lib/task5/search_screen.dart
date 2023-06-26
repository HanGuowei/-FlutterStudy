import 'package:flutter/material.dart';
import 'package:flutter_study/task5/api/github.dart';
import 'package:flutter_study/task5/model/search_result.dart';
import 'package:flutter_study/task5/repository_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _githubApi = GithubApi();
  bool _isLoading = false;
  int _currentPage = 1;
  final List<RepositoryItem> _result = [];
  final _textEditingController =
      TextEditingController(text: 'HanGuowei/FlutterStudy');
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_scrollListener)
      ..dispose();
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: _searchRepository,
                  icon: const Icon(Icons.search),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: _resultBuild(),
      ),
    );
  }

  Widget _resultBuild() {
    return ListView.builder(
      controller: _scrollController,
      itemCount: _result.length + 1,
      itemBuilder: (context, index) {
        if (index < _result.length) {
          final item = _result[index];
          return ListTile(
            title: Text(item.fullName),
            subtitle: Text(item.description ?? ''),
            onTap: () {
              _navToRepositoryScreen(item.fullName);
            },
          );
        } else {
          if (_isLoading) {
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
    );
  }

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      if (_isLoading) {
        _isLoading = false;
      } else {
        _isLoading = true;
        _loadMoreData();
      }
    }
  }

  Future<void> _loadMoreData() async {
    final data = await _githubApi.searchRepository(
      _textEditingController.text,
      _currentPage,
      100,
    );
    _currentPage++;
    setState(() {
      _result.addAll(data.items);
    });
  }

  void _navToRepositoryScreen(String fullName) {
    Navigator.of(context).push(
      MaterialPageRoute<RepositoryScreen>(
        builder: (context) => RepositoryScreen(
          fullName: fullName,
        ),
      ),
    );
  }

  Future<void> _searchRepository() async {
    _currentPage = 1;
    setState(() {
      _result.clear();
      _isLoading = true;
    });
    await _loadMoreData();
    setState(() {
      _isLoading = false;
    });
  }
}
