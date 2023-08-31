import 'package:flutter/material.dart';
import 'package:flutter_study/task7/model/article_info.dart';

class NewsCell extends StatelessWidget {
  const NewsCell({
    super.key,
    required this.info,
    required this.clickCallBack,
  });

  final ArticleInfo info;
  final ValueChanged<ArticleInfo> clickCallBack;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => clickCallBack(info),
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
                      info.title ?? '',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12,),
                    Text(
                      info.author ?? '',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              if (info.urlToImage != null)
                Expanded(
                  flex: 2,
                  child: Image.network(
                    info.urlToImage ?? '',
                    fit: BoxFit.cover,
                    width: 120,
                    height: 80,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
