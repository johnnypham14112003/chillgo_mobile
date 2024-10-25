import 'package:chillgo_mobile/src/core/themes/gap.dart';
import 'package:chillgo_mobile/src/core/utils/constants.dart';
import 'package:chillgo_mobile/src/core/utils/extention.dart';
import 'package:flutter/material.dart';

class HomeMenu extends StatelessWidget {
  const HomeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: SizedBox(
        width: context.querySize.width,
        height: 120,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildMenuButton(
              context,
              icon: Icons.airplanemode_active,
              label: 'Máy bay',
              onPressed: () => print('Airplane button pressed'),
            ),
            _buildMenuButton(
              context,
              icon: Icons.backpack_rounded,
              label: 'Chuyến đi',
              onPressed: () => print('Trip button pressed'),
            ),
            _buildMenuButton(
              context,
              icon: Icons.location_city_rounded,
              label: 'Khách sạn',
              onPressed: () => print('Hotel button pressed'),
            ),
            _buildMenuButton(
              context,
              icon: Icons.train_rounded,
              label: 'Tàu hỏa',
              onPressed: () => print('Train button pressed'),
            ),
            _buildMenuButton(
              context,
              icon: Icons.directions_bus_rounded,
              label: 'Xe buýt',
              onPressed: () => print('Bus button pressed'),
            ),
            _buildMenuButton(
              context,
              icon: Icons.car_rental,
              label: 'Thuê xe',
              onPressed: () => print('Car rental button pressed'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: Gap.s),
        child: InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: onPressed,
          child: Container(
            height: 110,
            decoration: BoxDecoration(
              color: context.theme.cardColor,
              borderRadius: BorderRadius.circular(100),
              boxShadow: [boxShadow],
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).secondaryHeaderColor,
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(7.5),
                      child: Icon(
                        icon,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    onPressed: onPressed,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Gap.xs),
                    child: Text(
                      label,
                      textAlign: TextAlign.center,
                      style: context.textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
