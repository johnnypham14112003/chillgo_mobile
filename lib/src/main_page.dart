import 'package:chillgo_mobile/src/core/themes/colors_theme.dart';
import 'package:chillgo_mobile/src/core/utils/extention.dart';
import 'package:chillgo_mobile/src/features/blog/blog_page.dart';
import 'package:chillgo_mobile/src/features/chat_bot/chat_ai_page.dart';
import 'package:chillgo_mobile/src/features/preferential/preferential_page.dart';
import 'package:chillgo_mobile/src/features/user/page/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/themes/gap.dart';
import 'features/home/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Widget> _children = const [];
  int _currentIndex = 0;
  @override
  void initState() {
    _children = [
      const HomePage(),
      const BlogPage(),
      const PreferentialPage(),
      const ProfilePage(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isDart = context.read<ThemeColorData>().isDark;

    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      body: IndexedStack(
        index: _currentIndex,
        children: _children,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(Gap.m, 0, Gap.m, Gap.s),
        child: Container(
          decoration: BoxDecoration(
              color: context.theme.cardColor,
              borderRadius: BorderRadius.circular(Gap.xxl),
              boxShadow: [
                BoxShadow(
                  color: isDart
                      ? context.theme.cardColor.withOpacity(0.5)
                      : Colors.grey.withOpacity(0.5),
                  spreadRadius: 0,
                  blurRadius: 4,
                  offset: const Offset(2, 2),
                ),
              ]),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(Gap.xxl),
            child: BottomNavigationBar(
              backgroundColor: context.theme.cardColor,
              currentIndex:
                  _currentIndex >= 2 ? _currentIndex + 1 : _currentIndex,
              selectedItemColor: context.theme.primaryColor,
              unselectedItemColor: isDart ? Colors.grey : Colors.black87,
              type: BottomNavigationBarType.fixed,
              selectedFontSize: 10,
              unselectedFontSize: 10,
              onTap: _handleOnTap,
              items: EnumDestinations.values.map((item) {
                return BottomNavigationBarItem(
                    icon: Icon(item.icon), label: item.label);
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }

  _handleOnTap(int value) {
    if (value == 2) {
      context.push(ChatAiPage());
      return;
    }
    setState(() {
      _currentIndex = value > 2 ? value - 1 : value;
    });
  }
}

enum EnumDestinations {
  home(label: 'Trang chủ', icon: Icons.home_rounded),
  blog(label: 'Blog', icon: Icons.wysiwyg_rounded),
  chatAI(label: 'Chat AI', icon: Icons.chat_rounded),
  preferential(label: 'Ưu đãi', icon: Icons.local_activity_rounded),
  profile(label: 'Tài khoản', icon: Icons.person_rounded);

  const EnumDestinations({required this.label, required this.icon});
  final String label;
  final IconData icon;
}
