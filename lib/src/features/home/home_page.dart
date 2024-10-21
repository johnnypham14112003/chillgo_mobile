import 'package:chillgo_mobile/src/core/utils/extention.dart';
import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';

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
            Container(
              width: MediaQuery.sizeOf(context).width,
              height: 180,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                      child: SizedBox(
                        width: MediaQuery.sizeOf(context).width,
                        child: TextFormField(
                          //controller: _model.textController,
                          //focusNode: _model.textFieldFocusNode,
                          autofocus: false,
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: false,
                            alignLabelWithHint: false,
                            hintText: 'Tìm kiếm...',
                            hintStyle: context.textTheme.bodyMedium,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                //color: Color(0x00000000),
                                color: Theme.of(context).indicatorColor,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(17),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context).secondaryHeaderColor,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(17),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xFFFF0000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(17),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xFFFF0000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(17),
                            ),
                            filled: true,
                            fillColor: Theme.of(context).cardColor,
                            prefixIcon: Icon(
                              Icons.search,
                              color: Theme.of(context).indicatorColor,
                            ),
                            suffixIcon: Icon(
                              Icons.mic,
                              color: Theme.of(context).indicatorColor,
                            ),
                          ),
                          style: context.textTheme.bodyMedium,
                          //validator: _model.textControllerValidator.asValidator(context),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 45,
                          height: 45,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            'assets/images/logo/user_avatar_default.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10, 0, 0, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Xin chào,',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          color: Theme.of(context).cardColor),
                                ),
                                Text(
                                  'Người dùng',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                          color: Theme.of(context)
                                              .secondaryHeaderColor),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: const AlignmentDirectional(10, 0),
                            child: GestureDetector(
                              onTap: () async {},
                              child: Row(children: [
                                Icon(
                                  Icons.place,
                                  color: Theme.of(context).cardColor,
                                  size: 16,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  "Việt Nam",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          color: Theme.of(context).cardColor),
                                ),
                              ]),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.notifications_rounded,
                            color: Theme.of(context).cardColor,
                            size: 25,
                          ),
                          onPressed: () {
                            //nav to notification Tab(){}
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 10),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width,
                height: 120,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {},
                      child: Container(
                        width: 63,
                        height: 110,
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {},
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .secondaryHeaderColor, // fillColor
                                    shape: BoxShape
                                        .circle, // borderRadius: 100 (hình tròn)
                                  ),
                                  padding: const EdgeInsets.all(7.5),
                                  // Để phù hợp với buttonSize = 50 và icon size = 35
                                  child: Icon(
                                    Icons.airplanemode_active,
                                    color: Theme.of(context)
                                        .primaryColor, // Màu icon
                                    size: 35, // Kích thước icon
                                  ),
                                ),
                                iconSize: 50,
                                // Kích thước tổng thể của button
                                onPressed: () {
                                  print('IconButton pressed ...');
                                },
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    10, 0, 10, 0),
                                child: Text(
                                  'Máy bay',
                                  textAlign: TextAlign.center,
                                  style: context.textTheme.bodySmall,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {},
                      child: Container(
                        width: 63,
                        height: 110,
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .secondaryHeaderColor, // fillColor
                                    shape: BoxShape
                                        .circle, // borderRadius: 100 (hình tròn)
                                  ),
                                  padding: const EdgeInsets.all(7.5),
                                  // Để phù hợp với buttonSize = 50 và icon size = 35
                                  child: Icon(
                                    Icons.backpack_rounded,
                                    color: Theme.of(context)
                                        .primaryColor, // Màu icon
                                    size: 35, // Kích thước icon
                                  ),
                                ),
                                iconSize: 50, // Kích thước tổng thể của button
                                onPressed: () {
                                  print('IconButton pressed ...');
                                },
                              ),
                              Text(
                                'Chuyến đi',
                                textAlign: TextAlign.center,
                                style: context.textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {},
                      child: Container(
                        width: 63,
                        height: 110,
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .secondaryHeaderColor, // fillColor
                                    shape: BoxShape
                                        .circle, // borderRadius: 100 (hình tròn)
                                  ),
                                  padding: const EdgeInsets.all(7.5),
                                  // Để phù hợp với buttonSize = 50 và icon size = 35
                                  child: Icon(
                                    Icons.location_city_rounded,
                                    color: Theme.of(context)
                                        .primaryColor, // Màu icon
                                    size: 35, // Kích thước icon
                                  ),
                                ),
                                iconSize: 50, // Kích thước tổng thể của button
                                onPressed: () {
                                  print('IconButton pressed ...');
                                },
                              ),
                              Text(
                                'Khách sạn',
                                textAlign: TextAlign.center,
                                style: context.textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {},
                      child: Container(
                        width: 63,
                        height: 110,
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .secondaryHeaderColor, // fillColor
                                    shape: BoxShape
                                        .circle, // borderRadius: 100 (hình tròn)
                                  ),
                                  padding: const EdgeInsets.all(7.5),
                                  // Để phù hợp với buttonSize = 50 và icon size = 35
                                  child: Icon(
                                    Icons.train_rounded,
                                    color: Theme.of(context)
                                        .primaryColor, // Màu icon
                                    size: 35, // Kích thước icon
                                  ),
                                ),
                                iconSize: 50, // Kích thước tổng thể của button
                                onPressed: () {
                                  print('IconButton pressed ...');
                                },
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    10, 0, 10, 0),
                                child: Text(
                                  'Tàu hỏa',
                                  textAlign: TextAlign.center,
                                  style: context.textTheme.bodySmall,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {},
                      child: Container(
                        width: 63,
                        height: 110,
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .secondaryHeaderColor, // fillColor
                                    shape: BoxShape
                                        .circle, // borderRadius: 100 (hình tròn)
                                  ),
                                  padding: const EdgeInsets.all(7.5),
                                  // Để phù hợp với buttonSize = 50 và icon size = 35
                                  child: Icon(
                                    Icons.directions_bus_rounded,
                                    color: Theme.of(context)
                                        .primaryColor, // Màu icon
                                    size: 35, // Kích thước icon
                                  ),
                                ),
                                iconSize: 50, // Kích thước tổng thể của button
                                onPressed: () {
                                  print('IconButton pressed ...');
                                },
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    10, 0, 10, 0),
                                child: Text(
                                  'Xe buýt',
                                  textAlign: TextAlign.center,
                                  style: context.textTheme.bodySmall,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {},
                      child: Container(
                        width: 63,
                        height: 110,
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .secondaryHeaderColor, // fillColor
                                    shape: BoxShape
                                        .circle, // borderRadius: 100 (hình tròn)
                                  ),
                                  padding: const EdgeInsets.all(7.5),
                                  // Để phù hợp với buttonSize = 50 và icon size = 35
                                  child: Icon(
                                    Icons.car_rental,
                                    color: Theme.of(context)
                                        .primaryColor, // Màu icon
                                    size: 35, // Kích thước icon
                                  ),
                                ),
                                iconSize: 50, // Kích thước tổng thể của button
                                onPressed: () {
                                  print('IconButton pressed ...');
                                },
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    10, 0, 10, 0),
                                child: Text(
                                  'Thuê xe',
                                  textAlign: TextAlign.center,
                                  style: context.textTheme.bodySmall,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 10),
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
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          'https://picsum.photos/seed/64/600',
                          width: 200,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          'https://picsum.photos/seed/839/600',
                          width: 200,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          'https://picsum.photos/seed/670/600',
                          width: 200,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
              child: Container(
                width: 100,
                height: 140,
                // decoration: BoxDecoration(
                //   color: FlutterFlowTheme.of(context).secondaryBackground,
                // ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Bạn Muốn Đi Đâu?',
                            style: context.textTheme.bodyLarge,
                          ),
                          TextButton(
                            onPressed: () async {},
                            style: TextButton.styleFrom(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 0, 0),
                                backgroundColor: const Color(0x00FFFFFF),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0),
                                )),
                            child: Text(
                              'Xem thêm',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                      color:
                                          Theme.of(context).primaryColorLight,
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
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {},
                            child: Stack(
                              alignment: const AlignmentDirectional(0, 1),
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    'https://picsum.photos/seed/162/600',
                                    width: 150,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  width: 150,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.transparent,
                                        Theme.of(context).indicatorColor
                                      ],
                                      stops: const [0, 1],
                                      begin: const AlignmentDirectional(0, -1),
                                      end: const AlignmentDirectional(0, 1),
                                    ),
                                  ),
                                ),
                                Text(
                                  'TP. Hồ Chí Minh',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                          color: Theme.of(context).cardColor),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {},
                            child: Stack(
                              alignment: const AlignmentDirectional(0, 1),
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    'https://images.unsplash.com/photo-1514876246314-d9a231ea21db?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwzfHxmaXJld29ya3N8ZW58MHx8fHwxNzI4MDM2NDAxfDA&ixlib=rb-4.0.3&q=80&w=1080',
                                    width: 150,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {},
                                  child: Container(
                                    width: 150,
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
                                ),
                                Text(
                                  'Hello World',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                          color: Theme.of(context).cardColor),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {},
                            child: Stack(
                              alignment: const AlignmentDirectional(0, 1),
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    'https://images.unsplash.com/photo-1465101046530-73398c7f28ca?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw0fHxuaWdodCUyMHNreXxlbnwwfHx8fDE3Mjc5NTI0Njd8MA&ixlib=rb-4.0.3&q=80&w=1080',
                                    width: 150,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  width: 150,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.transparent,
                                        Theme.of(context).indicatorColor
                                      ],
                                      stops: const [0, 1],
                                      begin: const AlignmentDirectional(0, -1),
                                      end: const AlignmentDirectional(0, 1),
                                    ),
                                  ),
                                ),
                                Text(
                                  'Hello World',
                                  style: context.textTheme.bodySmall?.copyWith(
                                      color: Theme.of(context).cardColor),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {},
                            child: Stack(
                              alignment: const AlignmentDirectional(0, 1),
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    'https://images.unsplash.com/photo-1525088553748-01d6e210e00b?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw4fHxjb2ZmZWV8ZW58MHx8fHwxNzI3OTU0NTQ3fDA&ixlib=rb-4.0.3&q=80&w=1080',
                                    width: 150,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  width: 150,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.transparent,
                                        Theme.of(context).indicatorColor
                                      ],
                                      stops: const [0, 1],
                                      begin: const AlignmentDirectional(0, -1),
                                      end: const AlignmentDirectional(0, 1),
                                    ),
                                  ),
                                ),
                                Text(
                                  'Hello World',
                                  style: context.textTheme.bodySmall?.copyWith(
                                      color: Theme.of(context).cardColor),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {},
                            child: Stack(
                              alignment: const AlignmentDirectional(0, 1),
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    'https://images.unsplash.com/photo-1495616811223-4d98c6e9c869?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw0fHxzdW5zZXR8ZW58MHx8fHwxNzI4MDExNzE4fDA&ixlib=rb-4.0.3&q=80&w=1080',
                                    width: 150,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  width: 150,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.transparent,
                                        Theme.of(context).indicatorColor
                                      ],
                                      stops: const [0, 1],
                                      begin: const AlignmentDirectional(0, -1),
                                      end: const AlignmentDirectional(0, 1),
                                    ),
                                  ),
                                ),
                                Text(
                                  'Hello World',
                                  style: context.textTheme.bodySmall?.copyWith(
                                      color: Theme.of(context).cardColor),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 10),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
              child: SizedBox(
                width: 100,
                height: 175,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
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
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 0, 0),
                                backgroundColor: const Color(0x00FFFFFF),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0),
                                )),
                            child: Text('Xem thêm',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                        color:
                                            Theme.of(context).primaryColorLight,
                                        decoration: TextDecoration.underline,
                                        decorationColor: Theme.of(context)
                                            .primaryColorLight)),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        scrollDirection: Axis.horizontal,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {},
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  alignment: const AlignmentDirectional(-1, 1),
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.network(
                                        'https://picsum.photos/seed/162/600',
                                        width: 150,
                                        height: 100,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Container(
                                      width: 55,
                                      height: 25,
                                      constraints: const BoxConstraints(
                                        minHeight: 10,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(24),
                                        gradient: LinearGradient(
                                          colors: [
                                            Colors.transparent,
                                            Theme.of(context).indicatorColor
                                          ],
                                          stops: const [0, 1],
                                          begin:
                                              const AlignmentDirectional(-1, 0),
                                          end: const AlignmentDirectional(1, 0),
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
                                            '4.7',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  'Hello World',
                                  style: context.textTheme.bodyMedium,
                                ),
                                Text(
                                  'Hello World',
                                  style: context.textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {},
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  alignment: const AlignmentDirectional(-1, 1),
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.network(
                                        'https://images.unsplash.com/photo-1481988535861-271139e06469?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyfHxzdW5zZXR8ZW58MHx8fHwxNzI4MDExNzE4fDA&ixlib=rb-4.0.3&q=80&w=1080',
                                        width: 150,
                                        height: 100,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Container(
                                      width: 55,
                                      height: 25,
                                      constraints: const BoxConstraints(
                                        minHeight: 10,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).cardColor,
                                        borderRadius: BorderRadius.circular(24),
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
                                            '4.7',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  'Hello World',
                                  style: context.textTheme.bodyMedium,
                                ),
                                Text(
                                  'Hello World',
                                  style: context.textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {},
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  alignment: const AlignmentDirectional(-1, 1),
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.network(
                                        'https://images.unsplash.com/photo-1459199698925-99516b9fe6a5?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwzfHxzdGFycnklMjBuaWdodHxlbnwwfHx8fDE3MjgwMDUwMTB8MA&ixlib=rb-4.0.3&q=80&w=1080',
                                        width: 150,
                                        height: 100,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Container(
                                      width: 55,
                                      height: 25,
                                      constraints: const BoxConstraints(
                                        minHeight: 10,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).cardColor,
                                        borderRadius: BorderRadius.circular(24),
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
                                            '4.7',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  'Hello World',
                                  style: context.textTheme.bodyMedium,
                                ),
                                Text(
                                  'Hello World',
                                  style: context.textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {},
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  alignment: const AlignmentDirectional(-1, 1),
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.network(
                                        'https://picsum.photos/seed/162/600',
                                        width: 150,
                                        height: 100,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Container(
                                      width: 55,
                                      height: 25,
                                      constraints: const BoxConstraints(
                                        minHeight: 10,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).cardColor,
                                        borderRadius: BorderRadius.circular(24),
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
                                            '4.7',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  'Hello World',
                                  style: context.textTheme.bodyMedium,
                                ),
                                Text(
                                  'Hello World',
                                  style: context.textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {},
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  alignment: const AlignmentDirectional(-1, 1),
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.network(
                                        'https://images.unsplash.com/photo-1514876246314-d9a231ea21db?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwzfHxmaXJld29ya3N8ZW58MHx8fHwxNzI4MDM2NDAxfDA&ixlib=rb-4.0.3&q=80&w=1080',
                                        width: 150,
                                        height: 100,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Container(
                                      width: 55,
                                      height: 25,
                                      constraints: const BoxConstraints(
                                        minHeight: 10,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).cardColor,
                                        borderRadius: BorderRadius.circular(24),
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
                                            '4.7',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  'Hello World',
                                  style: context.textTheme.bodyMedium,
                                ),
                                Text(
                                  'Hello World',
                                  style: context.textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 10),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
              child: Container(
                width: 100,
                height: 175,
                // decoration: BoxDecoration(
                //   color: FlutterFlowTheme.of(context).secondaryBackground,
                // ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Hướng Dẫn Viên Du Lịch',
                            style: context.textTheme.bodyLarge,
                          ),
                          TextButton(
                            onPressed: () async {},
                            style: TextButton.styleFrom(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 0, 0),
                                backgroundColor: const Color(0x00FFFFFF),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0),
                                )),
                            child: Text('Xem thêm',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                        color: Theme.of(context).primaryColor,
                                        decoration: TextDecoration.underline,
                                        decorationColor: Theme.of(context)
                                            .primaryColorLight)),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        scrollDirection: Axis.horizontal,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {},
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  alignment: const AlignmentDirectional(-1, 1),
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.network(
                                        'https://picsum.photos/seed/162/600',
                                        width: 150,
                                        height: 100,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Container(
                                      width: 55,
                                      height: 25,
                                      constraints: const BoxConstraints(
                                        minHeight: 10,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).cardColor,
                                        borderRadius: BorderRadius.circular(24),
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
                                            '4.7',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  'Hello World',
                                  style: context.textTheme.bodyMedium,
                                ),
                                Text(
                                  'Hello World',
                                  style: context.textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {},
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  alignment: const AlignmentDirectional(-1, 1),
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.network(
                                        'https://images.unsplash.com/photo-1481988535861-271139e06469?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyfHxzdW5zZXR8ZW58MHx8fHwxNzI4MDExNzE4fDA&ixlib=rb-4.0.3&q=80&w=1080',
                                        width: 150,
                                        height: 100,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Container(
                                      width: 55,
                                      height: 25,
                                      constraints: const BoxConstraints(
                                        minHeight: 10,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).cardColor,
                                        borderRadius: BorderRadius.circular(24),
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
                                            '4.7',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  'Hello World',
                                  style: context.textTheme.bodyMedium,
                                ),
                                Text(
                                  'Hello World',
                                  style: context.textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {},
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  alignment: const AlignmentDirectional(-1, 1),
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.network(
                                        'https://images.unsplash.com/photo-1459199698925-99516b9fe6a5?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwzfHxzdGFycnklMjBuaWdodHxlbnwwfHx8fDE3MjgwMDUwMTB8MA&ixlib=rb-4.0.3&q=80&w=1080',
                                        width: 150,
                                        height: 100,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Container(
                                      width: 55,
                                      height: 25,
                                      constraints: const BoxConstraints(
                                        minHeight: 10,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).cardColor,
                                        borderRadius: BorderRadius.circular(24),
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
                                            '4.7',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  'Hello World',
                                  style: context.textTheme.bodyMedium,
                                ),
                                Text(
                                  'Hello World',
                                  style: context.textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {},
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  alignment: const AlignmentDirectional(-1, 1),
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.network(
                                        'https://picsum.photos/seed/162/600',
                                        width: 150,
                                        height: 100,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Container(
                                      width: 55,
                                      height: 25,
                                      constraints: const BoxConstraints(
                                        minHeight: 10,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).cardColor,
                                        borderRadius: BorderRadius.circular(24),
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
                                            '4.7',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  'Hello World',
                                  style: context.textTheme.bodyMedium,
                                ),
                                Text(
                                  'Hello World',
                                  style: context.textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {},
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  alignment: const AlignmentDirectional(-1, 1),
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.network(
                                        'https://images.unsplash.com/photo-1514876246314-d9a231ea21db?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwzfHxmaXJld29ya3N8ZW58MHx8fHwxNzI4MDM2NDAxfDA&ixlib=rb-4.0.3&q=80&w=1080',
                                        width: 150,
                                        height: 100,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Container(
                                      width: 55,
                                      height: 25,
                                      constraints: const BoxConstraints(
                                        minHeight: 10,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).cardColor,
                                        borderRadius: BorderRadius.circular(24),
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
                                            '4.7',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  'Hello World',
                                  style: context.textTheme.bodyMedium,
                                ),
                                Text(
                                  'Hello World',
                                  style: context.textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
