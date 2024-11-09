import 'package:chillgo_mobile/src/core/themes/gap.dart';
import 'package:chillgo_mobile/src/core/utils/extention.dart';
import 'package:chillgo_mobile/src/features/blog/blog_detail_page.dart';
import 'package:chillgo_mobile/src/models/blog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../blog_provider.dart';

class BlogItem extends StatelessWidget {
  const BlogItem({
    super.key,
    required this.item,
  });

  final Blog item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Gap.m),
      child: GestureDetector(
        onTap: () {
          context.push(const BlogDetailPage());
          context.read<BlogProvider>().getBlogById(item.title);
        },
        child: Container(
          height: context.querySize.width / 2 - (Gap.l),
          padding: const EdgeInsets.all(Gap.m),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Gap.m),
              color: context.theme.cardColor),
          child: Row(
            children: [
              AspectRatio(
                aspectRatio: 4 / 3.5,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(Gap.s),
                  child: Image.network(
                    item.images.first,
                    fit: BoxFit.cover,
                    width: context.querySize.width / 2 - Gap.l,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Gap.s),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '#${item.tag}',
                        maxLines: 1,
                        style: context.textTheme.bodySmall?.copyWith(
                          color: context.theme.primaryColor,
                        ),
                      ),
                      Text(
                        item.tag,
                        maxLines: 2,
                        style: context.textTheme.titleSmall,
                      ),
                      Text(
                        item.content,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: context.textTheme.bodySmall,
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: Gap.s,
                            backgroundImage: NetworkImage(item.author.url),
                          ),
                          Text(
                            item.author.name,
                            style: context.textTheme.bodySmall
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          const Icon(Icons.favorite_outline_rounded),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
