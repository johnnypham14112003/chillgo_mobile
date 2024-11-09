import 'package:chillgo_mobile/src/core/configs/image_factory.dart';
import 'package:chillgo_mobile/src/core/themes/gap.dart';

import 'package:chillgo_mobile/src/features/home/widgets/home_menu.dart';
import 'package:chillgo_mobile/src/features/home/widgets/random_location.dart';
import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';

import 'widgets/home_app_bar.dart';
import 'widgets/top_location.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageDartWidgetState();
}

class _HomePageDartWidgetState extends State<HomePage> {
  //late HomePageDartModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: ListView(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          children: [
            const HomeAppBar(),
            const HomeMenu(),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
              child: Container(
                width: 100,
                height: 150,
                // decoration: BoxDecoration(
                //   color: FlutterFlowTheme.of(context).secondaryBackground,
                // ),
                child: Container(
                  width: double.infinity,
                  height: 200,
                  child: CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                      initialPage: 1,
                      viewportFraction: 0.5,
                      disableCenter: true,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.25,
                      enableInfiniteScroll: true,
                      scrollDirection: Axis.horizontal,
                    ),
                    items: [
                      ...ImageFactory.banner.map(
                        (item) => ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            item,
                            width: 200,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const RandomLocation(),
            const TopLocation(),
            const SizedBox(height: kBottomNavigationBarHeight + Gap.xl),
          ],
        ),
      ),
    );
  }
}
