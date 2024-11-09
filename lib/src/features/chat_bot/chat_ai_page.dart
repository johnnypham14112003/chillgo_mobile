import 'package:chillgo_mobile/src/core/configs/image_factory.dart';
import 'package:chillgo_mobile/src/core/themes/gap.dart';
import 'package:chillgo_mobile/src/core/utils/extention.dart';
import 'package:chillgo_mobile/src/features/cart/cart_provider.dart';
import 'package:chillgo_mobile/src/features/cart/widgets/item_package.dart';
import 'package:chillgo_mobile/src/features/chat_bot/widgets/chat_bubble_widget.dart';
import 'package:chillgo_mobile/src/features/user/account_provider.dart';
import 'package:chillgo_mobile/src/features/widgets/dialog_custom.dart';
import 'package:chillgo_mobile/src/features/widgets/wrapper_page.dart';
import 'package:chillgo_mobile/src/models/chat.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'chat_ai_provider.dart';

class ChatAiPage extends StatefulWidget {
  const ChatAiPage({super.key});

  @override
  State<ChatAiPage> createState() => _ChatAiPageState();
}

class _ChatAiPageState extends State<ChatAiPage> {
  final _messageController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final package = context.read<AccountProvider>().account?.package;
      if (package?.status == 'unpaid') {
        DialogCustom().showDialogConfirm(
          'Liên hệ admin',
          'Gói của quý khách chưa thanh toán, liên hệ admin nếu quý khách đã thanh toán !',
          barrierDismissible: false,
          onConfirm: () => context
            ..pop()
            ..pop(),
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: ChangeNotifierProvider(
        create: (context) => ChatAiProvider(),
        child: WrapperPage(
          titleAppBar: 'ChillGo AI',
          child:
              Consumer<ChatAiProvider>(builder: (context, chatProvider, child) {
            return Consumer<AccountProvider>(
                builder: (context, provider, child) {
              final package = provider.account!.package;
              return package == null
                  ? Expanded(
                      child: ListView(children: [
                        ...chatProvider.chatAiPackages.map(
                          (item) => Padding(
                            padding: const EdgeInsets.fromLTRB(
                                Gap.m, 0, Gap.m, Gap.m),
                            child: ItemPackage(
                              package: item,
                              onPressed: () => context
                                  .read<CartProvider>()
                                  .selectChatAiPackage(item),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(Gap.xl),
                          child: Column(
                            children: [
                              Text(
                                'Vui lòng mua 1 trong các gói trên\n để sử dụng ChillGo AI !',
                                style: context.textTheme.titleSmall,
                                textAlign: TextAlign.center,
                              ),
                              const CircleAvatar(
                                backgroundImage: AssetImage(ImageFactory.app),
                                radius: Gap.xxl,
                              )
                            ],
                          ),
                        ),
                      ]),
                    )
                  : Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(
                          Gap.m,
                          0,
                          Gap.m,
                          Gap.m,
                        ),
                        child: ConversationWidget(
                          messageController: _messageController,
                        ),
                      ),
                    );
            });
          }),
        ),
      ),
    );
  }
}

class ConversationWidget extends StatelessWidget {
  const ConversationWidget({
    super.key,
    required TextEditingController messageController,
  }) : _messageController = messageController;

  final TextEditingController _messageController;

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(Gap.m),
        borderSide: BorderSide.none);
    return Consumer<ChatAiProvider>(builder: (context, provider, child) {
      return Column(
        children: [
          Expanded(
            child: ListView(
              children: List.generate(provider.messages.length, (index) {
                final message = provider.messages[index];
                return ChatBubbleWidget(
                  isMine: message.sender == 'user',
                  message: message.message,
                  aiMessage: message.aiMessage,
                  time: message.time,
                  test: message.textTest,
                );
              }),
            ),
          ),
          TextField(
            controller: _messageController,
            decoration: InputDecoration(
                filled: true,
                fillColor: context.theme.cardColor,
                hintText: 'Nhập tin nhắn ...',
                hintStyle: context.textTheme.bodyMedium,
                border: border,
                enabledBorder: border,
                focusedBorder: border,
                suffixIcon: IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    final message = _messageController.text;
                    if (message.isNotEmpty) {
                      context.read<ChatAiProvider>().sendMessage(Message(
                            message: message,
                            sender: 'user',
                            time: DateTime.now(),
                          ));
                      _messageController.clear();
                      context.read<ChatAiProvider>().chatGenerate(message);
                    }
                  },
                )),
          ),
        ],
      );
    });
  }
}
