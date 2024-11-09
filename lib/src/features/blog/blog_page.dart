import 'package:chillgo_mobile/src/core/themes/gap.dart';
import 'package:chillgo_mobile/src/core/utils/extention.dart';
import 'package:chillgo_mobile/src/features/blog/blog_provider.dart';
import 'package:chillgo_mobile/src/features/blog/widgets/blog_action_bar.dart';
import 'package:chillgo_mobile/src/features/blog/widgets/blog_item.dart';
import 'package:chillgo_mobile/src/features/widgets/wrapper_page.dart';
import 'package:chillgo_mobile/src/models/blog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WrapperPage(
      titleAppBar: 'Blog Du lịch',
      isMainPage: true,
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.all(Gap.m),
          child: Consumer<BlogProvider>(builder: (context, provider, child) {
            final blogs = provider.otherBlogs;
            final firstBlog = provider.firstBlog;
            return CustomScrollView(
              slivers: [
                if (firstBlog != null) _buildFirstBlog(context, firstBlog),
                SliverPadding(
                  padding: const EdgeInsets.only(top: Gap.m),
                  sliver: SliverToBoxAdapter(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: context.querySize.width,
                        minHeight: 30,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Bài Viết Liên Quan',
                            style: context.textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding:
                      const EdgeInsets.only(bottom: kBottomNavigationBarHeight),
                  sliver: SliverList.builder(
                      itemCount: blogs.length,
                      itemBuilder: (context, index) {
                        final item = blogs[index];
                        return BlogItem(item: item);
                      }),
                )
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget _buildFirstBlog(BuildContext context, Blog firstBlog) {
    return SliverToBoxAdapter(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: context.querySize.width,
          maxHeight: context.querySize.width + kBottomNavigationBarHeight,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: Gap.l,
                  backgroundImage: NetworkImage(firstBlog.author.url),
                ),
                Expanded(
                  child: ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: Gap.s),
                    title: Text(
                      firstBlog.author.name,
                      style: context.textTheme.titleMedium,
                    ),
                    subtitle: Text(firstBlog.author.bio),
                  ),
                )
              ],
            ),
            Text(
              firstBlog.tag,
              style: context.textTheme.titleSmall,
            ),
            Text(
              firstBlog.content,
              style: context.textTheme.bodyMedium,
            ),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: firstBlog.images.length >= 2
                    ? _buildMultiImage(firstBlog.images)
                    : Image.network(
                        firstBlog.images.first,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            const BlogActionBar(),
            Text('#${firstBlog.tag}'),
          ],
        ),
      ),
    );
  }

  Widget _buildMultiImage(List<String> images) => Column(
        children: [
          Expanded(
            child: Image.network(
              images.first,
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
          ),
          const SizedBox(height: Gap.xs),
          Expanded(
            child: Row(children: [
              Expanded(
                child: Image.network(
                  images[1],
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                ),
              ),
              const SizedBox(width: Gap.xs),
              Expanded(
                child: Image.network(
                  images[2],
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                ),
              ),
            ]),
          )
        ],
      );
}
