import 'package:chillgo_mobile/src/core/themes/gap.dart';
import 'package:chillgo_mobile/src/core/utils/extention.dart';
import 'package:chillgo_mobile/src/features/blog/blog_provider.dart';
import 'package:chillgo_mobile/src/features/blog/widgets/blog_action_bar.dart';
import 'package:chillgo_mobile/src/features/widgets/wrapper_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BlogDetailPage extends StatelessWidget {
  const BlogDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BlogProvider>(builder: (context, provider, child) {
      final blog = provider.blogDetail;
      return WrapperPage(
        titleAppBar: 'Bài viết',
        action: IconButton(
          onPressed: () {},
          icon: Icon(Icons.favorite, color: context.theme.cardColor),
        ),
        child: blog == null
            ? const SizedBox()
            : Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(Gap.m),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        blog.title,
                        style: context.textTheme.titleMedium,
                      ),
                      Text(
                        blog.content,
                        style: context.textTheme.bodyMedium,
                      ),
                      Text(
                        '#${blog.tag}',
                        style: context.textTheme.bodyMedium
                            ?.copyWith(fontStyle: FontStyle.italic),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: Gap.m),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(Gap.m),
                          child: SizedBox(
                            width: double.infinity,
                            child: Image.network(
                              blog.images.first,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const BlogActionBar()
                    ],
                  ),
                ),
              ),
      );
    });
  }
}
