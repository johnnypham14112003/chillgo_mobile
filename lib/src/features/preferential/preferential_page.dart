import 'package:chillgo_mobile/src/core/configs/image_factory.dart';
import 'package:chillgo_mobile/src/core/themes/gap.dart';
import 'package:chillgo_mobile/src/core/utils/extention.dart';
import 'package:chillgo_mobile/src/features/widgets/wrapper_page.dart';
import 'package:flutter/material.dart';

class PreferentialPage extends StatelessWidget {
  const PreferentialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WrapperPage(
        titleAppBar: 'Ưu đãi',
        isMainPage: true,
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: Gap.xxl,
                backgroundImage: AssetImage(ImageFactory.app),
              ),
              Text('Tính năng này sẽ sớm ra mắt!',
                  style: context.textTheme.titleMedium),
              const SizedBox(height: kBottomNavigationBarHeight),
            ],
          ),
        ));
  }
}
