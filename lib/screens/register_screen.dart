import 'package:chat_flutter_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

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
                    title: 'Registro',
                  ),
                  _FormRegisterScreen(),
                  LabelsLoginScreen(
                    route: 'login',
                    label: 'Ingresa con tu cuenta',
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

class _FormRegisterScreen extends StatefulWidget {
  const _FormRegisterScreen({Key? key}) : super(key: key);

  @override
  _FormRegisterScreenState createState() => _FormRegisterScreenState();
}

class _FormRegisterScreenState extends State<_FormRegisterScreen> {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
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
            hintText: 'Nombre completo',
            icon: Icons.person_add_alt_1_outlined,
            textController: nameController,
            textInputType: TextInputType.text,
          ),
          CustomInputWidget(
            hintText: 'Nombre de usuario',
            icon: Icons.person_outline,
            textController: nameController,
            textInputType: TextInputType.text,
          ),
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
            title: 'Registro',
            onPressed: () =>
                print('${emailController.text}\n${passwordController.text}'),
          ),
        ],
      ),
    );
  }
}
