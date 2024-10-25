import 'dart:io';

import 'package:chillgo_mobile/src/core/themes/gap.dart';
import 'package:chillgo_mobile/src/core/utils/extention.dart';
import 'package:chillgo_mobile/src/features/user/account_provider.dart';
import 'package:chillgo_mobile/src/features/widgets/dialog_custom.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdateAvatarScreen extends StatelessWidget {
  final File file;
  const UpdateAvatarScreen({
    super.key,
    required this.file,
  });

  @override
  Widget build(BuildContext context) {
    final radius = context.querySize.width / 5;
    return Scaffold(
      body: Center(
          child: CircleAvatar(
        radius: radius,
        backgroundImage: FileImage(file),
      )),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(Gap.m),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: context.pop,
                icon: const Icon(
                  Icons.close_rounded,
                  size: Gap.xxl,
                )),
            IconButton(
              onPressed: () async {
                final success = await DialogCustom().showLoading<bool>(context,
                    () => context.read<AccountProvider>().updateAvatar(file));
                context.pop();
                context.showSnackBar(success
                    ? 'Cập nhật ảnh đại diện thành công'
                    : 'Cập nhật ảnh đại diện thất bại');
              },
              icon: const Icon(
                Icons.check_rounded,
                size: Gap.xxl,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
