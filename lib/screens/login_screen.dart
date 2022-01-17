import 'package:chat_flutter_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: SizedBox(
              height: _screenHeight * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  LogoLoginScreen(
                    title: 'Chat App',
                  ),
                  _FormLoginScreen(),
                  LabelsLoginScreen(
                    route: 'register',
                    label: '¡Crea una cuenta ahora!',
                  ),
                  Text(
                    'Términos y condiciones de uso',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _FormLoginScreen extends StatefulWidget {
  const _FormLoginScreen({Key? key}) : super(key: key);

  @override
  __FormLoginScreenState createState() => __FormLoginScreenState();
}

class __FormLoginScreenState extends State<_FormLoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 5.0,
      ),
      child: Column(
        children: <Widget>[
          CustomInputWidget(
            hintText: 'Email',
            icon: Icons.mail_outline,
            textController: emailController,
            textInputType: TextInputType.emailAddress,
          ),
          CustomInputWidget(
            hintText: 'Password',
            icon: Icons.password_outlined,
            textController: passwordController,
            textInputType: TextInputType.visiblePassword,
            isPassword: true,
          ),
          CustomElevatedButton(
            title: 'Ingrese',
            onPressed: () =>
                print('${emailController.text}\n${passwordController.text}'),
          ),
        ],
      ),
    );
  }
}
