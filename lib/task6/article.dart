import 'package:flutter/material.dart';

import 'entity/article_info.dart';

// typedef GestureTapCallback = void Function();
class Article extends StatefulWidget {
  const Article({super.key, required this.onTap, required this.articlesBean});

  final GestureTapCallback onTap;
  final ArticleInfo articlesBean;

  @override
  State<Article> createState() => _ArticleState();
}

class _ArticleState extends State<Article> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: BorderDirectional(
          bottom:
              BorderSide(color: Theme.of(context).colorScheme.outlineVariant),
        ),
      ),
      child: InkWell(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.articlesBean.title,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        widget.articlesBean.author ?? '',
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall
                            ?.copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                if (widget.articlesBean.urlToImage != null)
                  Expanded(
                    flex: 2,
                    child: Image.network(
                      widget.articlesBean.urlToImage ?? '',
                      fit: BoxFit.fitHeight,
                      errorBuilder: (context, object, stack) => Container(),
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
