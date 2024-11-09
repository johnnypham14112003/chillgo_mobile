import 'package:chillgo_mobile/src/core/configs/image_factory.dart';
import 'package:chillgo_mobile/src/core/themes/gap.dart';
import 'package:chillgo_mobile/src/core/utils/extention.dart';
import 'package:chillgo_mobile/src/features/location/location_provider.dart';
import 'package:chillgo_mobile/src/features/location/page/all_location_page.dart';
import 'package:chillgo_mobile/src/features/location/page/deatil_location_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RandomLocation extends StatelessWidget {
  const RandomLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
      child: Consumer<LocationProvider>(builder: (context, provider, child) {
        return SizedBox(
          height: context.querySize.width * 0.38,
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(Gap.m, 0, Gap.m, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Bạn Muốn Đi Đâu?',
                      style: context.textTheme.titleMedium,
                    ),
                    TextButton(
                      onPressed: () {
                        context.push(
                          const AllLocationPage(
                            title: 'Bạn Muốn Đi Đâu?',
                          ),
                        );
                      },
                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                      child: Text(
                        'Xem thêm',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).primaryColorLight,
                            decoration: TextDecoration.underline,
                            decorationColor:
                                Theme.of(context).primaryColorLight),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  scrollDirection: Axis.horizontal,
                  children: provider.randomLocations
                      .map(
                        (item) => Padding(
                          padding: const EdgeInsets.only(left: Gap.s),
                          child: GestureDetector(
                            onTap: () {
                              context
                                  .read<LocationProvider>()
                                  .getLocationById(item.id);
                              context.push(const LocationDetailPage());
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(Gap.s),
                              child: SizedBox(
                                width: context.querySize.width * 0.38,
                                child: Stack(
                                  alignment: const AlignmentDirectional(0, 1),
                                  children: [
                                    Positioned.fill(
                                      child: Image.network(
                                        item.images.first,
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) =>
                                                Image.asset(
                                          ImageFactory.defaultImg,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Colors.transparent,
                                            Theme.of(context).indicatorColor
                                          ],
                                          stops: const [0, 1],
                                          begin:
                                              const AlignmentDirectional(0, -1),
                                          end: const AlignmentDirectional(0, 1),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(Gap.s),
                                      child: Text(
                                        item.address ?? item.name,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: context.textTheme.bodySmall
                                            ?.copyWith(
                                                fontWeight: FontWeight.w600,
                                                color: Theme.of(context)
                                                    .cardColor),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
