import 'package:chillgo_mobile/src/core/themes/gap.dart';
import 'package:chillgo_mobile/src/core/utils/extention.dart';
import 'package:flutter/material.dart';

class WrapperBox extends StatelessWidget {
  final Widget title;
  final String? value;
  final VoidCallback? onTap;
  final Widget? trailing;
  const WrapperBox(
      {super.key, required this.title, this.value, this.onTap, this.trailing});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Gap.s),
      child: InkWell(
        borderRadius: BorderRadius.circular(Gap.s),
        onTap: onTap,
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
              title,
              const Spacer(),
              if (value != null)
                Text(
                  value!,
                  style: context.textTheme.bodySmall,
                ),
              if (trailing != null) trailing!
            ],
          ),
        ),
      ),
    );
  }
}
