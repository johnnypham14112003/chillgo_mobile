import 'package:chillgo_mobile/src/core/utils/extention.dart';
import 'package:flutter/material.dart';

class HomeMenu extends StatelessWidget {
  const HomeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
      child: SizedBox(
        width: context.querySize.width,
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
                            color: Theme.of(context).primaryColor, // Màu icon
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
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
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
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
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
                            color: Theme.of(context).primaryColor, // Màu icon
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
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
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
                            color: Theme.of(context).primaryColor, // Màu icon
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
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
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
                            color: Theme.of(context).primaryColor, // Màu icon
                            size: 35, // Kích thước icon
                          ),
                        ),
                        iconSize: 50, // Kích thước tổng thể của button
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
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
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
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
                            color: Theme.of(context).primaryColor, // Màu icon
                            size: 35, // Kích thước icon
                          ),
                        ),
                        iconSize: 50, // Kích thước tổng thể của button
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
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
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
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
                            color: Theme.of(context).primaryColor, // Màu icon
                            size: 35, // Kích thước icon
                          ),
                        ),
                        iconSize: 50, // Kích thước tổng thể của button
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
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
    );
  }
}
