import 'dart:async';

import 'package:flutter/material.dart';

class TypingAnimationText extends StatefulWidget {
  final String text;
  final TextStyle? textStyle;
  final Duration typingSpeed;
  final VoidCallback? onAnimationComplete;
  const TypingAnimationText({
    super.key,
    required this.text,
    this.textStyle,
    this.typingSpeed = const Duration(milliseconds: 50),
    this.onAnimationComplete,
  });

  @override
  State<TypingAnimationText> createState() => _TypingAnimationTextState();
}

class _TypingAnimationTextState extends State<TypingAnimationText> {
  String _displayText = '';
  late Timer _timer;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _startTypingAnimation();
  }

  @override
  void didUpdateWidget(covariant TypingAnimationText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.text != widget.text) {
      _resetAnimation();
    }
  }

  void _resetAnimation() {
    _timer.cancel();
    setState(() {
      _displayText = '';
      _currentIndex = 0;
    });
    _startTypingAnimation();
  }

  void _startTypingAnimation() {
    _timer = Timer.periodic(widget.typingSpeed, (timer) {
      if (_currentIndex < widget.text.length) {
        setState(() {
          _displayText = widget.text.substring(0, _currentIndex + 1);
          _currentIndex++;
        });
      } else {
        _timer.cancel();
        widget.onAnimationComplete?.call();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _displayText,
      style: widget.textStyle,
    );
  }
}
