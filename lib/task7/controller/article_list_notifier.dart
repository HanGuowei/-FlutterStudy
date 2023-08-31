import 'package:flutter_study/task7/api/news_api.dart';
import 'package:flutter_study/task7/model/article_info.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'article_list_notifier.g.dart';

@riverpod
class ArticleListNotifier extends _$ArticleListNotifier {
  final int _pageSize = 20;
  final refreshController = RefreshController(initialRefresh: true);

  @override
  ArticleListState build() => ArticleListState();

  Future<void> fetchItems(String keyword) async {
    state = state.copyWith(
      isLoading: true,
    );
    final data = await NewsApi().getNewsList(keyword, state.page, _pageSize);
    state = state.copyWith(
      isLoading: false,
    );
    if (data == null) {
      return;
    }
    state = state.copyWith(
      items: data.articles ?? [],
    );
  }

  Future<void> refreshItems(String keyword) async {
    final data = await NewsApi().getNewsList(keyword, 1, _pageSize);
    refreshController.refreshCompleted();
    if (data == null) {
      return;
    }
    state = state.copyWith(
      items: data.articles ?? <ArticleInfo>[],
      page: 1,
    );
  }

  Future<void> loadMoreItems(String keyword) async {
    final nextPage = state.page + 1;
    final data = await NewsApi().getNewsList(keyword, nextPage, _pageSize);
    refreshController.loadComplete();
    if (data == null) {
      return;
    }
    if ((data.articles?.length ?? 0) < _pageSize) {
      refreshController.loadNoData();
    }
    state = state.copyWith(
        items: [...state.items, ...data.articles ?? <ArticleInfo>[]],
        page: nextPage,
    );
  }
}

class ArticleListState {

  ArticleListState({
    this.items = const <ArticleInfo>[],
    this.isLoading = false,
    this.page = 1,
  });

  final List<ArticleInfo> items;
  final bool isLoading;
  final int page;

  ArticleListState copyWith({
    List<ArticleInfo>? items,
    bool? isLoading,
    int? page,
  }) {
    return ArticleListState(
      items: items ?? this.items,
      isLoading: isLoading ?? this.isLoading,
      page: page ?? this.page,
    );
  }
}
