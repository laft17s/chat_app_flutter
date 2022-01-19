import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String message;
  final String userId;
  final AnimationController animationCtrl;

  const ChatMessage({
    Key? key,
    required this.message,
    required this.userId,
    required this.animationCtrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animationCtrl,
      child: SizeTransition(
        sizeFactor: CurvedAnimation(
          parent: animationCtrl,
          curve: Curves.bounceOut,
        ),
        child: Container(
          child: userId == '123'
              ? _transmitterBubbleMessage()
              : _receiverBubbleMessage(),
        ),
      ),
    );
  }

  Widget _transmitterBubbleMessage() {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 5.0,
          left: 50.0,
          right: 5.0,
        ),
        decoration: BoxDecoration(
          color: Colors.cyan,
          borderRadius: BorderRadius.circular(20.0),
        ),
        padding: const EdgeInsets.all(8.0),
        child: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _receiverBubbleMessage() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 5.0,
          left: 5.0,
          right: 50.0,
        ),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(20.0),
        ),
        padding: const EdgeInsets.all(8.0),
        child: Text(
          message,
          style: const TextStyle(
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}
