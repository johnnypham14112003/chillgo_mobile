import 'package:chillgo_mobile/src/core/themes/gap.dart';
import 'package:chillgo_mobile/src/core/utils/extention.dart';
import 'package:chillgo_mobile/src/core/utils/format.dart';
import 'package:chillgo_mobile/src/models/chat_ai_package.dart';
import 'package:flutter/material.dart';

class ItemPackage extends StatelessWidget {
  final ChatAiPackage package;
  final VoidCallback? onPressed;
  const ItemPackage({super.key, required this.package, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Gap.m),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(width: 0.5, color: context.theme.primaryColor),
        borderRadius: BorderRadius.circular(Gap.m),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          package.name,
          style: context.textTheme.titleMedium,
        ),
        Text(
          package.description,
          style: context.textTheme.bodySmall,
        ),
        const SizedBox(height: Gap.s),
        if (onPressed != null)
          Row(
            children: [
              Text(
                '${Formatter.currency(package.price)}đ${package.duration != 0 ? ' / ${package.duration} tháng' : ' / 24h'} ',
                style: context.textTheme.titleSmall
                    ?.copyWith(color: context.theme.primaryColor),
              ),
              const Spacer(),
              FilledButton(
                onPressed: onPressed,
                child: const Text('Mua ngay'),
              ),
            ],
          )
      ]),
    );
  }
}
