import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_study/task7/api/news_api.dart';
import 'package:flutter_study/task7/model/article_info.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

final searchQueryProvider = StateProvider<String>((_) => '');

final articleListProvider =
  StateNotifierProvider<ArticleListNotifier, ArticleListState>(
    (ref) {
      return ArticleListNotifier(ref);
    }
);

class ArticleListNotifier extends StateNotifier<ArticleListState> {

  ArticleListNotifier(this.ref) : super(ArticleListState());
  final int _pageSize = 20;
  final refreshController = RefreshController(initialRefresh: true);
  final Ref ref;

  Future<void> fetchItems() async {
    state = state.copyWith(
      isLoading: true,
    );
    final keyword = ref.read(searchQueryProvider);
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

  Future<void> refreshItems() async {
    final keyword = ref.read(searchQueryProvider);
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

  Future<void> loadMoreItems() async {
    final nextPage = state.page + 1;
    final keyword = ref.read(searchQueryProvider);
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
