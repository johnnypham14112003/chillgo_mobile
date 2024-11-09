import 'package:chillgo_mobile/src/core/configs/image_factory.dart';
import 'package:chillgo_mobile/src/core/themes/colors_theme.dart';
import 'package:chillgo_mobile/src/core/themes/gap.dart';
import 'package:chillgo_mobile/src/core/utils/constants.dart';
import 'package:chillgo_mobile/src/core/utils/extention.dart';
import 'package:chillgo_mobile/src/core/utils/format.dart';
import 'package:chillgo_mobile/src/models/ai_message.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'typing_animation_text.dart';

class ChatBubbleWidget extends StatelessWidget {
  final bool isMine;
  final String message;
  final DateTime time;
  final AIMessage? aiMessage;
  final String? test;
  const ChatBubbleWidget({
    super.key,
    required this.isMine,
    required this.message,
    required this.time,
    this.aiMessage,
    this.test,
  });

  @override
  Widget build(BuildContext context) {
    final isDart = context.read<ThemeColorData>().isDark;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Gap.s),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment:
                isMine ? MainAxisAlignment.end : MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (!isMine)
                Padding(
                  padding: const EdgeInsets.only(right: Gap.s),
                  child: Image.asset(
                    ImageFactory.chatbot,
                    width: context.querySize.width * 0.1,
                  ),
                ),
              !isMine && message == 'loading'
                  ? Image.asset(
                      ImageFactory.loading,
                      height: 60,
                    )
                  : Container(
                      constraints: BoxConstraints(
                          maxWidth: context.querySize.width * 0.8 - Gap.xl),
                      padding: const EdgeInsets.all(Gap.m),
                      decoration: decoration(context),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: isMine
                            ? CrossAxisAlignment.end
                            : CrossAxisAlignment.start,
                        children: [
                          Text(message,
                              style: context.textTheme.bodyMedium?.copyWith(
                                  color: isMine
                                      ? Colors.black
                                      : isDart
                                          ? Colors.black
                                          : Colors.white)),
                          const SizedBox(height: Gap.xs),
                          Text(
                            Formatter.time(time),
                            style: context.textTheme.bodySmall?.copyWith(
                                color: isMine
                                    ? Colors.black
                                    : isDart
                                        ? Colors.black
                                        : Colors.white),
                          ),
                        ],
                      ),
                    ),
            ],
          ),
          // if (aiMessage != null) PlanMessageWidget(message: aiMessage!)
          if (test != null) buildFormattedText(context, test!)
        ],
      ),
    );
  }

  Decoration decoration(BuildContext context) {
    return isMine
        ? const BoxDecoration(
            color: Color.fromRGBO(230, 242, 174, 1),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Gap.m),
              topRight: Radius.circular(Gap.m),
              bottomLeft: Radius.circular(Gap.m),
            ),
          )
        : BoxDecoration(
            color: context.theme.primaryColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(Gap.m),
              topRight: Radius.circular(Gap.m),
              bottomRight: Radius.circular(Gap.m),
            ),
          );
  }

  Widget buildFormattedText(BuildContext context, String text) {
    List<TextSpan> spans = [];
    RegExp exp = RegExp(r'\*\*(.*?)\*\*');
    int lastMatchEnd = 0;

    // Tìm tất cả các cặp **text**
    for (Match match in exp.allMatches(text)) {
      // Thêm text thường trước phần bold
      if (match.start > lastMatchEnd) {
        spans.add(TextSpan(
          text: text.substring(lastMatchEnd, match.start),
          style: context.textTheme.bodyMedium,
        ));
      }

      // Thêm phần text in đậm (bỏ đi các dấu **)
      spans.add(TextSpan(
        text: match.group(1), // Lấy nội dung trong **...**
        style: context.textTheme.titleSmall,
      ));

      lastMatchEnd = match.end;
    }

    // Thêm phần text còn lại sau match cuối cùng
    if (lastMatchEnd < text.length) {
      spans.add(TextSpan(
        text: text.substring(lastMatchEnd),
        style: context.textTheme.bodyMedium,
      ));
    }

    return Padding(
      padding: const EdgeInsets.only(top: Gap.m),
      child: RichText(
        text: TextSpan(
          children: spans,
        ),
      ),
    );
  }
}

class PlanMessageWidget extends StatefulWidget {
  final AIMessage message;
  const PlanMessageWidget({super.key, required this.message});

  @override
  State<PlanMessageWidget> createState() => _PlanMessageWidgetState();
}

class _PlanMessageWidgetState extends State<PlanMessageWidget> {
  double _width = 0;
  int? _indexView;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Gap.s),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(Gap.m),
            child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: Gap.s,
                crossAxisSpacing: Gap.s,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  ...widget.message.historicalSites.map(
                    (item) => GestureDetector(
                      onTap: () {
                        _width = context.querySize.width;
                        _indexView =
                            widget.message.historicalSites.indexOf(item);
                        setState(() {});
                      },
                      child: Container(
                        padding: const EdgeInsets.all(Gap.s),
                        decoration: BoxDecoration(
                            color: context.theme.cardColor,
                            borderRadius: BorderRadius.circular(Gap.s),
                            boxShadow: [boxShadow]),
                        child: Column(
                          children: [
                            Expanded(
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          width: Gap.xs,
                                          color: context
                                              .theme.secondaryHeaderColor,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(Gap.s),
                                        image: const DecorationImage(
                                            image: AssetImage(
                                                ImageFactory.defaultImg),
                                            fit: BoxFit.cover)),
                                  ),
                                  Positioned(
                                      right: Gap.xs,
                                      top: Gap.xs,
                                      child: Icon(
                                        Icons.bookmark_rounded,
                                        color: context.theme.cardColor,
                                      ))
                                ],
                              ),
                            ),
                            const SizedBox(height: Gap.xs),
                            Text(
                              item.name,
                              maxLines: 2,
                              style: context.textTheme.bodySmall
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ]),
          ),
          AnimatedContainer(
            alignment: Alignment.topLeft,
            width: _width,
            padding: const EdgeInsets.all(Gap.xs),
            decoration: BoxDecoration(
              color: context.theme.cardColor,
              borderRadius: BorderRadius.circular(Gap.s),
            ),
            // Define how long the animation should take.
            duration: const Duration(seconds: 2),
            // Provide an optional curve to make the animation feel smoother.
            curve: Curves.fastOutSlowIn,

            child: _indexView != null
                ? Builder(builder: (context) {
                    final historicalSite =
                        widget.message.historicalSites[_indexView!];
                    final tips = widget.message.tips;
                    final food = widget.message.foodAndDrink[_indexView!];
                    final transportation = widget.message.transportation;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(Gap.s),
                          child: Text(
                            historicalSite.name,
                            style: context.textTheme.titleSmall,
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: Gap.s),
                          child: TypingAnimationText(
                            text:
                                '${historicalSite.history} ${historicalSite.significance} ${historicalSite.visitingTime} ${historicalSite.facilities}',
                            textStyle: context.textTheme.bodyMedium,
                            typingSpeed: const Duration(milliseconds: 20),
                            onAnimationComplete: () {
                              print('Animation completed!');
                            },
                          ),
                        ),
                        GridView.count(
                            crossAxisCount: 3,
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            crossAxisSpacing: Gap.xs,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              ...PlanTravelEnum.values.map(
                                (plan) => Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      plan.icon,
                                      color: context.theme.primaryColor,
                                    ),
                                    Text(
                                      plan.title,
                                      maxLines: 1,
                                      style: const TextStyle(
                                          fontSize: 9,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Builder(builder: (context) {
                                      String getText() {
                                        switch (plan) {
                                          case PlanTravelEnum.tips:
                                            return tips.bestTimeToVisit;
                                          case PlanTravelEnum.transportation:
                                            return transportation.gettingAround;
                                          case PlanTravelEnum.food:
                                            return food.name;
                                          case PlanTravelEnum.destination:
                                            return historicalSite.name;
                                          case PlanTravelEnum.culturalAspects:
                                            return '';
                                          case PlanTravelEnum.preferential:
                                            return '';
                                        }
                                      }

                                      final text = getText();
                                      return Text(
                                        text,
                                        style: context.textTheme.bodySmall,
                                        maxLines: 4,
                                      );
                                    })
                                  ],
                                ),
                              )
                            ])
                      ],
                    );
                  })
                : null,
          ),
        ],
      ),
    );
  }
}
