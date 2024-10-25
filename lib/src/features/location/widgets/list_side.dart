import 'package:chillgo_mobile/src/core/themes/gap.dart';
import 'package:chillgo_mobile/src/core/utils/extention.dart';
import 'package:flutter/material.dart';

class ListSide extends StatelessWidget {
  const ListSide({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: ConstrainedBox(
      constraints: const BoxConstraints(
        maxHeight: 56,
        maxWidth: double.infinity,
      ),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: Sides.values
            .map(
              (season) => Padding(
                padding: const EdgeInsets.all(Gap.s),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: context.theme.canvasColor,
                      borderRadius: BorderRadius.circular(Gap.xxl),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 0,
                          blurRadius: 2,
                          offset: const Offset(0, 1),
                        ),
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(Gap.s),
                    child: Text(
                      season.name,
                      style: context.textTheme.bodySmall?.copyWith(
                          color: context.theme.primaryColor,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    ));
  }
}

enum Sides {
  south(name: 'Miền Bắc'),
  central(name: 'Miền Trung'),
  north(name: 'Miền Nam'),
  west(name: 'Miền Tây');

  const Sides({required this.name});
  final String name;
}
