import 'package:chillgo_mobile/src/core/themes/gap.dart';
import 'package:chillgo_mobile/src/core/utils/extention.dart';
import 'package:flutter/material.dart';

class ListSeason extends StatelessWidget {
  const ListSeason({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: context.querySize.width * 0.5,
          maxWidth: double.infinity,
        ),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: Season.values
              .map(
                (season) => Padding(
                  padding: const EdgeInsets.only(left: Gap.s),
                  child: Container(
                    width: context.querySize.width * 0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Gap.s),
                      image: DecorationImage(
                          image: NetworkImage(season.image), fit: BoxFit.cover),
                    ),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(Gap.s),
                        child: Text(
                          season.name,
                          style: context.textTheme.titleMedium
                              ?.copyWith(color: context.theme.cardColor),
                        ),
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

enum Season {
  spring(
      name: 'Mùa Xuân',
      image:
          'https://images.pexels.com/photos/250591/pexels-photo-250591.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
  summer(
      name: 'Mùa Hè',
      image:
          'https://images.pexels.com/photos/26597870/pexels-photo-26597870/free-photo-of-bi-n-b-u-tr-i-danh-lam-th-ng-c-nh-b-bi-n.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
  fall(
      name: 'Mùa Thu',
      image:
          'https://images.pexels.com/photos/1590551/pexels-photo-1590551.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
  winter(
      name: 'Mùa Đông',
      image:
          'https://images.pexels.com/photos/27568660/pexels-photo-27568660/free-photo-of-phong-c-nh-nui-thien-nhien-canh-d-ng.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1');

  const Season({required this.name, required this.image});
  final String name;
  final String image;
}
