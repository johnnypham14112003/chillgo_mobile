import 'package:chillgo_mobile/src/app.dart';
import 'package:chillgo_mobile/src/core/themes/gap.dart';
import 'package:chillgo_mobile/src/core/utils/extention.dart';
import 'package:flutter/material.dart';

class DialogCustom {
  DialogCustom._internal();
  static final DialogCustom _instance = DialogCustom._internal();
  factory DialogCustom() {
    return _instance;
  }

  Future<T> showLoading<T>(
    BuildContext context,
    Future<T> Function() asyncFunction,
  ) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => Dialog(
        backgroundColor: context.theme.cardColor,
        child: const Padding(
          padding: EdgeInsets.all(Gap.s),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(
                width: Gap.s,
              ),
              Text(
                'Vui lòng đợi...',
              )
            ],
          ),
        ),
      ),
    );

    try {
      final result = await asyncFunction();
      return result;
    } finally {
      if (context.mounted) {
        Navigator.of(context).pop();
      }
    }
  }

  showDialogConfirm(String title, String content,
      {VoidCallback? onConfirm,
      bool barrierDismissible = true,
      String textButton = 'Đã hiểu'}) {
    showDialog(
      context: navigaterKey.currentContext!,
      barrierDismissible: barrierDismissible,
      builder: (context) => AlertDialog(
        backgroundColor: context.theme.cardColor,
        title: Text(title),
        content: Text(content),
        actions: [
          FilledButton(
            onPressed: onConfirm,
            child: Text(textButton),
          ),
        ],
      ),
    );
  }
}
