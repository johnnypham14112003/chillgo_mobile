import 'package:chillgo_mobile/src/core/themes/gap.dart';
import 'package:chillgo_mobile/src/core/utils/extention.dart';
import 'package:chillgo_mobile/src/features/location/location_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopLocation extends StatelessWidget {
  const TopLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, Gap.s, 0, Gap.s),
      child: SizedBox(
        height: context.querySize.width * 0.6,
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
                    style: context.textTheme.bodyLarge,
                  ),
                  TextButton(
                    onPressed: () async {},
                    style: TextButton.styleFrom(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        backgroundColor: const Color(0x00FFFFFF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        )),
                    child: Text('Xem thêm',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).primaryColorLight,
                            decoration: TextDecoration.underline,
                            decorationColor:
                                Theme.of(context).primaryColorLight)),
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
                            padding: const EdgeInsets.only(left: Gap.s),
                            child: GestureDetector(
                              onTap: () async {},
                              child: SizedBox(
                                width: context.querySize.width * 0.4,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(Gap.s),
                                            child: Image.network(
                                              item.images.first,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Positioned(
                                            left: Gap.xxs,
                                            bottom: Gap.xxs,
                                            child: Container(
                                              height: 25,
                                              padding:
                                                  const EdgeInsets.symmetric(
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
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Icon(
                                                    Icons.star_rounded,
                                                    color: Theme.of(context)
                                                        .secondaryHeaderColor,
                                                    size: 24,
                                                  ),
                                                  Text(
                                                    item.totalRating.toString(),
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
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
                                    Text(
                                      item.ticketPrice.toString(),
                                      style: context.textTheme.bodySmall,
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
