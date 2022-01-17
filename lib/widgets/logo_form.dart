import 'package:flutter/material.dart';

class LogoLoginScreen extends StatelessWidget {
  final String title;

  const LogoLoginScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      margin: const EdgeInsets.only(top: 50.0),
      child: Center(
        child: Column(
          children: <Widget>[
            const ClipOval(
              child: Image(
                image: AssetImage('assets/luna-logo.jpg'),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 30.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
