import 'package:flutter/material.dart';

class CustomInputWidget extends StatelessWidget {
  final IconData icon;
  final String hintText;
  final TextEditingController textController;
  final TextInputType textInputType;
  final bool isPassword;

  const CustomInputWidget({
    Key? key,
    required this.icon,
    required this.hintText,
    required this.textController,
    this.textInputType = TextInputType.text,
    this.isPassword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 15.0,
      ),
      padding: const EdgeInsets.only(
        top: 5.0,
        left: 5.0,
        right: 20.0,
        bottom: 5.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, 5),
            blurRadius: 5,
          ),
        ],
      ),
      child: TextField(
        controller: textController,
        autocorrect: false,
        keyboardType: textInputType,
        obscureText: isPassword,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
          ),
          focusedBorder: InputBorder.none,
          border: InputBorder.none,
          hintText: hintText,
        ),
      ),
    );
  }
}
