import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:chat_flutter_app/widgets/chat_message.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  final _textController = TextEditingController();
  final _focusNode = FocusNode();

  bool _isTexting = false;

  final List<ChatMessage> _chatBubbles = [
    // const ChatMessage(message: 'Mi nombre es Luis...', userId: '123'),
    // const ChatMessage(message: '¿Quién eres?', userId: '124'),
    // const ChatMessage(message: 'Hola...', userId: '123'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 1,
        title: Column(
          children: <Widget>[
            CircleAvatar(
              child: const Text(
                'Te',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              backgroundColor: Colors.cyan[400],
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Text(
              'Test001',
              style: TextStyle(color: Colors.black87, fontSize: 10.0),
            ),
          ],
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Flexible(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: _chatBubbles.length,
                itemBuilder: (_, i) => _chatBubbles[i],
                reverse: true,
              ),
            ),
            const Divider(
              height: 1,
            ),
            Container(
              color: Colors.white,
              height: 50.0,
              child: _inputChat(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _inputChat() {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 8.0,
        ),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmit,
                onChanged: (msg) {
                  setState(() {
                    (msg.trim().isNotEmpty)
                        ? _isTexting = true
                        : _isTexting = false;
                  });
                },
                decoration: const InputDecoration.collapsed(
                    hintText: 'Enviar mensaje...'),
                focusNode: _focusNode,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 4.0,
              ),
              child: Platform.isIOS
                  ? CupertinoButton(
                      child: const Text('Enviar'),
                      onPressed: _isTexting
                          ? () => _handleSubmit(_textController.text.trim())
                          : null,
                    )
                  : IconTheme(
                      data: IconThemeData(
                        color: Colors.cyan[400],
                      ),
                      child: IconButton(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onPressed: _isTexting
                            ? () => _handleSubmit(_textController.text.trim())
                            : null,
                        icon: const Icon(
                          Icons.send,
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  _handleSubmit(String msg) {
    // print('Mensaje: $msg');

    if (msg.isEmpty) return;

    _textController.clear();
    _focusNode.requestFocus();

    final newBubbleMessage = ChatMessage(
      message: msg,
      userId: '123',
      animationCtrl: AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 550),
      ),
    );
    _chatBubbles.insert(0, newBubbleMessage);
    newBubbleMessage.animationCtrl.forward();

    setState(() {
      _isTexting = false;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose

    for (ChatMessage msg in _chatBubbles) {
      msg.animationCtrl.dispose();
    }

    super.dispose();
  }
}
