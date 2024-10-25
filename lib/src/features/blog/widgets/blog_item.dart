import 'package:chillgo_mobile/src/core/configs/image_factory.dart';
import 'package:chillgo_mobile/src/core/themes/gap.dart';
import 'package:chillgo_mobile/src/core/utils/extention.dart';
import 'package:chillgo_mobile/src/models/location.dart';
import 'package:flutter/material.dart';

class BlogItem extends StatelessWidget {
  const BlogItem({
    super.key,
    required this.item,
  });

  final Location item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Gap.m),
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
                padding: const EdgeInsets.symmetric(
                    horizontal: Gap.s),
                child: Column(
                  children: [
                    Text(
                      '#${item.address}',
                      maxLines: 1,
                      style: context.textTheme.bodySmall
                          ?.copyWith(
                        color: context.theme.primaryColor,
                      ),
                    ),
                    Text(
                      item.name,
                      maxLines: 2,
                      style: context.textTheme.titleSmall,
                    ),
                    Text(
                      item.description,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: context.textTheme.bodySmall,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: Gap.s,
                          backgroundImage: AssetImage(
                              ImageFactory.avatarDefault),
                        ),
                        Text(
                          'User',
                          style: context.textTheme.titleSmall,
                        ),
                        const Spacer(),
                        const Icon(
                            Icons.favorite_outline_rounded),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
