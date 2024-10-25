import 'package:chillgo_mobile/src/core/themes/gap.dart';
import 'package:chillgo_mobile/src/features/widgets/wrapper_page.dart';
import 'package:flutter/material.dart';

class ChatBotPage extends StatelessWidget {
  const ChatBotPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WrapperPage(
      titleAppBar: 'ChillGo AI',
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(Gap.m),
        child: TextFormField(
          decoration: const InputDecoration(),
        ),
      ),
      child: const Column(
        children: [],
      ),
    );
  }
}
