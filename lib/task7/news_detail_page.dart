import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_study/task7/controller/article_notifier.dart';
import 'package:flutter_study/task7/model/article_info.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetailPage extends ConsumerStatefulWidget {
  const NewsDetailPage({
    super.key,
    required this.articleInfo,
  });

  final ArticleInfo articleInfo;

  @override
  ConsumerState<NewsDetailPage> createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends ConsumerState<NewsDetailPage> {
  final _controller = WebViewController();

  @override
  void initState() {
    super.initState();
    final uri = Uri.tryParse(widget.articleInfo.url ?? '');
    if (uri == null) {
      return;
    }
    _controller.loadRequest(
      uri,
    );
  }

  @override
  Widget build(BuildContext context) {
    final articlesNotifier = ref.watch(articleNotifierProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.articleInfo.title ?? '',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final isSave = articlesNotifier.isSave(widget.articleInfo,);
          if (isSave) {
            articlesNotifier.unSaveArticle(widget.articleInfo,);
          } else {
            articlesNotifier.saveArticle(widget.articleInfo,);
          }
        },
        child: Icon(
          ref.watch(isFavoritesProvider(info: widget.articleInfo))
              ? Icons.favorite
              : Icons.favorite_border,
        ),
      ),
      body: WebViewWidget(
        controller: _controller,
      ),
    );
  }
}
