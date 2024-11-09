import 'package:chillgo_mobile/src/core/configs/image_factory.dart';
import 'package:chillgo_mobile/src/core/themes/gap.dart';
import 'package:chillgo_mobile/src/core/utils/extention.dart';
import 'package:flutter/material.dart';

class SocialInforWidget extends StatelessWidget {
  const SocialInforWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: socials
          .map(
            (e) => Padding(
              padding: const EdgeInsets.only(bottom: Gap.s),
              child: InkWell(
                borderRadius: BorderRadius.circular(Gap.s),
                onTap: () {},
                child: Ink(
                  width: context.querySize.width,
                  padding: const EdgeInsets.all(Gap.m),
                  height: 50,
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(Gap.s),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        e['icon']!,
                      ),
                      const SizedBox(width: Gap.s),
                      Text(
                        e['label']!,
                        style: context.textTheme.bodyMedium,
                      ),
                      const Spacer(),
                      Text(
                        'Liên kết',
                        style: context.textTheme.titleSmall
                            ?.copyWith(color: context.theme.primaryColor),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}

final socials = [
  {'icon': ImageFactory.facebook, 'label': 'Facebook'},
  {'icon': ImageFactory.apple, 'label': 'Apple'},
  {'icon': ImageFactory.google, 'label': 'Google'}
];
