import 'package:chillgo_mobile/src/core/themes/gap.dart';
import 'package:chillgo_mobile/src/core/utils/extention.dart';
import 'package:flutter/widgets.dart';

class ItemPackage extends StatelessWidget {
  const ItemPackage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(Gap.m),
      padding: const EdgeInsets.all(Gap.m),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(width: 0.5, color: context.theme.primaryColor),
        borderRadius: BorderRadius.circular(Gap.m),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Gói tiêu chuẩn',
              style: context.textTheme.titleMedium,
            ),
            Text(
              '20.000 vnđ',
              style: context.textTheme.titleMedium
                  ?.copyWith(color: context.theme.primaryColor),
            ),
          ],
        ),
        Text(
          'Dành cho khách hàng muốn trải nghiệm tính năng đặc biệt của ứng dụng chúng tôi',
          style: context.textTheme.bodySmall,
        )
      ]),
    );
  }
}
