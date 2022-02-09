import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String title;
  final Function onPressed;

  const CustomElevatedButton({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed(),
      style: ElevatedButton.styleFrom(
        primary: Colors.cyan,
        elevation: 2,
        shape: const StadiumBorder(),
      ),
      child: SizedBox(
        width: double.infinity,
        height: 55.0,
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17.0,
            ),
          ),
        ),
      ),
    );
  }
}
