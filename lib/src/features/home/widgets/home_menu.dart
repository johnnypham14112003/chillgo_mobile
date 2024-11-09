import 'package:chillgo_mobile/src/core/themes/gap.dart';
import 'package:chillgo_mobile/src/core/utils/constants.dart';
import 'package:chillgo_mobile/src/core/utils/extention.dart';
import 'package:flutter/material.dart';

class HomeMenu extends StatelessWidget {
  const HomeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Gap.xs, vertical: Gap.m),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          _buildMenuButton(
            context,
            icon: Icons.airplanemode_active,
            label: 'Máy\nbay',
            onPressed: () => print('Airplane button pressed'),
          ),
          _buildMenuButton(
            context,
            icon: Icons.backpack_outlined,
            label: 'Chuyến\nđi',
            onPressed: () => print('Trip button pressed'),
          ),
          _buildMenuButton(
            context,
            icon: Icons.location_city_outlined,
            label: 'Khách\nsạn',
            onPressed: () => print('Hotel button pressed'),
          ),
          _buildMenuButton(
            context,
            icon: Icons.train_outlined,
            label: 'Tàu\nhỏa',
            onPressed: () => print('Train button pressed'),
          ),
          _buildMenuButton(
            context,
            icon: Icons.directions_bus_outlined,
            label: 'Xe\nbuýt',
            onPressed: () => print('Bus button pressed'),
          ),
          _buildMenuButton(
            context,
            icon: Icons.car_rental,
            label: 'Thuê\nxe',
            onPressed: () => print('Car rental button pressed'),
          ),
        ],
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
        padding: const EdgeInsets.symmetric(horizontal: Gap.xs),
        child: InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: onPressed,
          child: Container(
            decoration: BoxDecoration(
              color: context.theme.cardColor,
              borderRadius: BorderRadius.circular(100),
              boxShadow: [boxShadow],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                IconButton(
                  icon: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).secondaryHeaderColor,
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(Gap.s),
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
                    style: const TextStyle(fontSize: 10),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
