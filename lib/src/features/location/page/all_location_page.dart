import 'package:chillgo_mobile/src/core/configs/image_factory.dart';
import 'package:chillgo_mobile/src/core/themes/gap.dart';
import 'package:chillgo_mobile/src/core/utils/extention.dart';
import 'package:chillgo_mobile/src/features/location/location_provider.dart';
import 'package:chillgo_mobile/src/features/location/widgets/list_season.dart';
import 'package:chillgo_mobile/src/features/location/widgets/list_side.dart';
import 'package:chillgo_mobile/src/features/widgets/wrapper_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'deatil_location_page.dart';

class AllLocationPage extends StatefulWidget {
  final String title;
  const AllLocationPage({super.key, required this.title});

  @override
  State<AllLocationPage> createState() => _AllLocationPageState();
}

class _AllLocationPageState extends State<AllLocationPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<LocationProvider>().getAllLocation();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WrapperPage(
      titleAppBar: widget.title,
      isSearchBar: true,
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.all(Gap.m),
          child: CustomScrollView(
            slivers: [
              const ListSeason(),
              const ListSide(),
              SliverPadding(
                padding: const EdgeInsets.symmetric(vertical: Gap.m),
                sliver: SliverToBoxAdapter(
                  child: Text(
                    widget.title,
                    style: context.textTheme.bodyLarge,
                  ),
                ),
              ),
              Consumer<LocationProvider>(
                builder: (context, provider, child) => SliverGrid.builder(
                    itemCount: provider.locations.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: Gap.m,
                            mainAxisSpacing: Gap.m,
                            childAspectRatio: 0.8),
                    itemBuilder: (ctx, index) {
                      final item = provider.locations[index];
                      return GestureDetector(
                        onTap: () {
                          context
                              .read<LocationProvider>()
                              .getLocationById(item.id);
                          context.push(const LocationDetailPage());
                        },
                        child: Container(
                          padding: const EdgeInsets.all(Gap.s),
                          decoration: BoxDecoration(
                            color: context.theme.cardColor,
                            borderRadius: BorderRadius.circular(Gap.m),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 0,
                                blurRadius: 2,
                                offset: const Offset(0, 1),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                  child: Stack(
                                children: [
                                  Positioned.fill(
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(Gap.s),
                                      child: Image.network(
                                        item.images.first,
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        errorBuilder:
                                            (context, error, stackTrace) =>
                                                Image.asset(
                                                    ImageFactory.defaultImg),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: Gap.xxs,
                                    right: Gap.xxs,
                                    child: Icon(
                                      Icons.favorite,
                                      color: context.theme.cardColor,
                                    ),
                                  ),
                                ],
                              )),
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: Gap.s),
                                    child: Text(
                                      '#${item.address}',
                                      maxLines: 1,
                                      style: context.textTheme.bodySmall
                                          ?.copyWith(
                                              color:
                                                  context.theme.primaryColor),
                                    ),
                                  ),
                                  Text(
                                    item.name,
                                    maxLines: 1,
                                    style: context.textTheme.bodySmall
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    item.description,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: context.textTheme.bodySmall
                                        ?.copyWith(fontStyle: FontStyle.italic),
                                  )
                                ],
                              )),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
