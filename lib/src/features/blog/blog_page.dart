import 'package:chillgo_mobile/src/core/configs/image_factory.dart';
import 'package:chillgo_mobile/src/core/themes/gap.dart';
import 'package:chillgo_mobile/src/core/utils/extention.dart';
import 'package:chillgo_mobile/src/features/blog/blog_provider.dart';
import 'package:chillgo_mobile/src/features/blog/widgets/blog_action_bar.dart';
import 'package:chillgo_mobile/src/features/blog/widgets/blog_item.dart';
import 'package:chillgo_mobile/src/features/widgets/wrapper_page.dart';
import 'package:chillgo_mobile/src/models/location.dart';
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
            final blogs = provider.otherLocations;
            final firstBlog = provider.firstLocation;
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
                SliverList.builder(
                    itemCount: blogs.length,
                    itemBuilder: (context, index) {
                      final item = blogs[index];
                      return BlogItem(item: item);
                    })
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget _buildFirstBlog(BuildContext context, Location firstBlog) {
    return SliverToBoxAdapter(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: context.querySize.width,
          maxHeight: context.querySize.width,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                CircleAvatar(
                  radius: Gap.l,
                  backgroundImage: AssetImage(ImageFactory.avatarDefault),
                ),
                Expanded(
                    child: ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: Gap.s),
                  title: Text('User'),
                  subtitle: Text('Blogger'),
                ))
              ],
            ),
            Text(
              firstBlog.name,
              style: context.textTheme.titleSmall,
            ),
            Text(
              firstBlog.description,
              style: context.textTheme.bodyMedium,
            ),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: Image.network(
                  firstBlog.images.first,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const BlogActionBar()
          ],
        ),
      ),
    );
  }
}
