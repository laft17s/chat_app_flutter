import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

showAlert(BuildContext context, String title, String description) {
  // Android Platform

  if (Platform.isAndroid) {
    showDialog(
      context: context,
      // builder: (_) => AlertDialog(
      //   title: Container(
      //     color: Colors.red,
      //     child: Text(
      //       title,
      //       textAlign: TextAlign.center,
      //       style: const TextStyle(
      //         color: Colors.white,
      //       ),
      //     ),
      //   ),
      //   content: Text(description),
      //   actions: <Widget>[
      //     MaterialButton(
      //       onPressed: () => Navigator.pop(context),
      //       textColor: Colors.cyan,
      //       elevation: 5,
      //       child: const Center(
      //         child: Text('OK'),
      //       ),
      //     ),
      //   ],
      // ),
      builder: (_) => _PopUpAlertDialog(
        title: title,
        description: description,
      ),
    );
  }

  // IOS Platform

  if (Platform.isIOS) {
    showCupertinoDialog(
      context: context,
      builder: (_) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(description),
        actions: <Widget>[
          CupertinoDialogAction(
            onPressed: () => Navigator.pop(context),
            isDefaultAction: true,
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}

class _PopUpAlertDialog extends StatefulWidget {
  final String title, description;

  const _PopUpAlertDialog({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  State<_PopUpAlertDialog> createState() => __PopUpAlertDialogState();
}

class __PopUpAlertDialogState extends State<_PopUpAlertDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 550,
      ),
    );

    scaleAnimation = CurvedAnimation(
        parent: animationController, curve: Curves.elasticInOut);

    animationController.addListener(() => setState(() {}));

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ScaleTransition(
        scale: scaleAnimation,
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Stack(
            alignment: Alignment.topCenter,
            clipBehavior: Clip.none,
            children: <Widget>[
              SizedBox(
                height: 200.0,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 55.0,
                    right: 5.0,
                    bottom: 10.0,
                    left: 5.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        widget.title,
                        style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.description,
                        style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 20.0,
                        ),
                      ),
                      MaterialButton(
                        onPressed: () => Navigator.pop(context),
                        textColor: Colors.cyan,
                        elevation: 5,
                        child: const Center(
                          child: Text('OK'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Positioned(
                top: -50.0,
                child: CircleAvatar(
                  backgroundColor: Colors.redAccent,
                  radius: 50.0,
                  child: Icon(
                    Icons.error_outline,
                    color: Colors.white,
                    size: 50.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
