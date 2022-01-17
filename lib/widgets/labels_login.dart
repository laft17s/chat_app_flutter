import 'package:flutter/material.dart';

class LabelsLoginScreen extends StatelessWidget {
  final String route;
  final String label;

  const LabelsLoginScreen({
    Key? key,
    required this.route,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Text(
          '¿Ya tienes una cuenta?',
          style: TextStyle(
            color: Colors.black54,
            fontSize: 15,
            fontWeight: FontWeight.w300,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        GestureDetector(
          onTap: () => Navigator.pushReplacementNamed(context, route),
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.blue,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
