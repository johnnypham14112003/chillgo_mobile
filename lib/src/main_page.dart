import 'package:chillgo_mobile/src/features/blog/blog_page.dart';
import 'package:chillgo_mobile/src/features/chat_bot/chat_bot_page.dart';
import 'package:chillgo_mobile/src/features/preferential/preferential_page.dart';
import 'package:chillgo_mobile/src/features/user/profile_page.dart';
import 'package:flutter/material.dart';

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
      const ChatBotPage(),
      const PreferentialPage(),
      ProfilePage(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _children,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (value) => setState(() {
          _currentIndex = value;
        }),
        destinations: EnumDestinations.values.map((item) {
          return NavigationDestination(
              icon: Icon(item.icon), label: item.label);
        }).toList(),
      ),
    );
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