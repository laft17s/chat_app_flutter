import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:chat_flutter_app/widgets/widgets.dart';
import 'package:chat_flutter_app/services/auth_service.dart';
import 'package:chat_flutter_app/helpers/show_alert.dart';

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
    final authService = Provider.of<AuthService>(
      context,
      listen: false,
    );

    _loginUser() async {
      FocusScope.of(context).unfocus();

      final loginUserOK = await authService.loginUser(
        emailController.text.trim(),
        passwordController.text.trim(),
      );

      if (loginUserOK) {
        print('OK');
      } else {
        // print('Credenciales no Válidas');
        showAlert(
          context,
          'LOGIN Incorrecto',
          'Credenciales NO Válidas.\nIntente nuevamente...',
        );
      }
    }

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
            onPressed: authService.validating ? () => null : () => _loginUser,
          ),
        ],
      ),
    );
  }
}
