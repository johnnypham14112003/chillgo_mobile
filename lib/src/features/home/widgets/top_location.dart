import 'package:chillgo_mobile/src/core/configs/image_factory.dart';
import 'package:chillgo_mobile/src/core/themes/gap.dart';
import 'package:chillgo_mobile/src/core/utils/constants.dart';
import 'package:chillgo_mobile/src/core/utils/extention.dart';
import 'package:chillgo_mobile/src/features/location/location_provider.dart';
import 'package:chillgo_mobile/src/features/location/page/all_location_page.dart';
import 'package:chillgo_mobile/src/features/location/page/deatil_location_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopLocation extends StatelessWidget {
  const TopLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, Gap.s, 0, Gap.s),
      child: SizedBox(
        height: context.querySize.width * 0.53,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(Gap.m, 0, Gap.m, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Top Địa Điểm Du Lịch',
                    style: context.textTheme.titleMedium,
                  ),
                  TextButton(
                    onPressed: () {
                      context.push(
                        const AllLocationPage(
                          title: 'Top Địa Điểm Du Lịch',
                        ),
                      );
                    },
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    child: Text('Xem thêm',
                        style: context.textTheme.bodySmall?.copyWith(
                            color: context.theme.primaryColorLight,
                            decoration: TextDecoration.underline,
                            decorationColor: context.theme.primaryColorLight)),
                  )
                ],
              ),
            ),
            Expanded(
              child: Consumer<LocationProvider>(
                  builder: (context, provider, child) {
                return ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  scrollDirection: Axis.horizontal,
                  children: provider.topLocations
                      .map((item) => Padding(
                            padding: const EdgeInsets.only(
                                left: Gap.s, bottom: Gap.s),
                            child: GestureDetector(
                              onTap: () {
                                context
                                    .read<LocationProvider>()
                                    .getLocationById(item.id);
                                context.push(const LocationDetailPage());
                              },
                              child: Container(
                                width: context.querySize.width * 0.4,
                                padding: const EdgeInsets.all(Gap.xs),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(Gap.s),
                                  color: context.theme.cardColor,
                                  boxShadow: [boxShadow],
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(Gap.s),
                                              border: Border.all(
                                                  width: 3,
                                                  color: context
                                                      .theme.primaryColor),
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: item.images.first.isEmpty
                                                    ? const AssetImage(
                                                        ImageFactory.defaultImg)
                                                    : NetworkImage(
                                                        item.images.first,
                                                      ),
                                              )),
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                left: Gap.xxs,
                                                bottom: Gap.xxs,
                                                child: Container(
                                                  height: 25,
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: Gap.xs),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            Gap.l),
                                                    gradient: LinearGradient(
                                                      colors: [
                                                        Colors.transparent,
                                                        Theme.of(context)
                                                            .indicatorColor
                                                      ],
                                                      stops: const [0, 1],
                                                      begin:
                                                          const AlignmentDirectional(
                                                              -1, 0),
                                                      end:
                                                          const AlignmentDirectional(
                                                              1, 0),
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Icon(
                                                        Icons.star_rounded,
                                                        color: Theme.of(context)
                                                            .secondaryHeaderColor,
                                                        size: 24,
                                                      ),
                                                      Text(
                                                        item.totalRating
                                                            .toString(),
                                                        style: context
                                                            .textTheme.bodySmall
                                                            ?.copyWith(
                                                          color: context
                                                              .theme.cardColor,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                right: 0,
                                                child: Icon(
                                                  Icons.favorite,
                                                  color:
                                                      context.theme.cardColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: Gap.s),
                                    Text(
                                      item.name,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: context.textTheme.bodySmall
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            maxLines: 1,
                                            'từ ${item.ticketPrice!.round()}đ',
                                            style: context.textTheme.bodySmall
                                                ?.copyWith(
                                                    color: context
                                                        .theme.primaryColor),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                          child: FilledButton(
                                            onPressed: () {},
                                            style: FilledButton.styleFrom(
                                              backgroundColor: context
                                                  .theme.secondaryHeaderColor,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: Gap.s),
                                            ),
                                            child: Text(
                                              'Mua ngay',
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: context
                                                      .theme.primaryColor),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ))
                      .toList(),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
