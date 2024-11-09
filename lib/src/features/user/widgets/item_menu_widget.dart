import 'package:chillgo_mobile/src/core/themes/gap.dart';
import 'package:chillgo_mobile/src/core/utils/extention.dart';
import 'package:flutter/material.dart';

class ItemMenuWidget extends StatelessWidget {
  final String title;
  final IconData? icon;
  final VoidCallback? onTap;
  const ItemMenuWidget({super.key, required this.title, this.icon, this.onTap});

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (icon != null)
                Icon(
                  icon,
                  color: Theme.of(context).indicatorColor,
                ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                  child: Text(
                    title,
                    style: context.textTheme.titleSmall,
                  ),
                ),
              ),
              Icon(
                Icons.chevron_right_rounded,
                color: context.theme.primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
