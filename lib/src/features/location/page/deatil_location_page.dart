import 'package:chillgo_mobile/src/core/themes/gap.dart';
import 'package:chillgo_mobile/src/core/utils/constants.dart';
import 'package:chillgo_mobile/src/core/utils/extention.dart';
import 'package:chillgo_mobile/src/core/utils/format.dart';
import 'package:chillgo_mobile/src/features/location/location_provider.dart';
import 'package:chillgo_mobile/src/features/widgets/wrapper_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LocationDetailPage extends StatelessWidget {
  const LocationDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LocationProvider>(builder: (context, provider, child) {
      final detail = provider.detailLocation;
      return WrapperPage(
        titleAppBar: 'Chi tiết địa điểm',
        action: IconButton(
          onPressed: () {},
          icon: Icon(Icons.favorite, color: context.theme.cardColor),
        ),
        bottomNavigationBar: Container(
          height: kBottomNavigationBarHeight + Gap.m,
          padding: const EdgeInsets.all(Gap.m),
          decoration: BoxDecoration(
            color: context.theme.cardColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(Gap.m),
              topRight: Radius.circular(Gap.m),
            ),
            boxShadow: [boxShadow],
          ),
          child: Row(
            children: [
              Expanded(
                  child: Row(
                children: [
                  Text('Giá vé:', style: context.textTheme.bodySmall),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Gap.xs),
                    child: Text('${detail?.ticketPrice?.round()}đ',
                        style: context.textTheme.titleSmall),
                  ),
                ],
              )),
              Expanded(
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: context.theme.secondaryHeaderColor,
                  ),
                  onPressed: () {
                    context.showSnackBar('Tính năng đang phát triển');
                  },
                  child: Text(
                    'Mua ngay',
                    style: context.textTheme.titleSmall
                        ?.copyWith(color: context.theme.primaryColor),
                  ),
                ),
              ),
            ],
          ),
        ),
        child: detail == null
            ? const SizedBox()
            : Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(Gap.m),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        detail.name,
                        style: context.textTheme.titleMedium,
                      ),
                      Text(
                        detail.description,
                        style: context.textTheme.bodyMedium,
                      ),
                      Text(
                        '#${detail.address}',
                        style: context.textTheme.bodyMedium
                            ?.copyWith(fontStyle: FontStyle.italic),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: Gap.m),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(Gap.m),
                          child: SizedBox(
                            width: double.infinity,
                            child: Image.network(
                              detail.images.first,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Icon(
                            Icons.star_rate_rounded,
                            color: Colors.amber,
                          ),
                          Text(detail.totalRating.toString()),
                          const Spacer(),
                          Text(Formatter.dateTime(detail.lastUpdated)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
      );
    });
  }
}
