import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nofelet/pages/main_page.dart';
import 'package:nofelet/pages/registraion_page.dart';
import '../main.dart';
import '../widgets/Button_Widget.dart';
import '../widgets/input.dart';

class AuthPage extends StatefulWidget {

  final VoidCallback onClickedReg;

  const AuthPage({Key? key, required this.onClickedReg}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // bool showLogin = true;

  @override
  Widget build(BuildContext context) {

    Future _buttonEnter() async {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator(),),
      );

        try {
          await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),);
          emailController.clear();
          passwordController.clear();
        } on FirebaseAuthException catch (e) {
          print(e);
        }
      navigatorKey.currentState!.popUntil((route) => route.isFirst);
    }



    Widget _form(){
      return Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 170, bottom: 10),
            child: input("EMAIL", emailController, false, false, 1),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: input("PASSWORD", passwordController, true, false, 1),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: SizedBox(
              height: 40,
              width: 150,
              child: button("Войти", _buttonEnter),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: SizedBox(
              height: 40,
              width: 150,
              child: button("Регистрация", widget.onClickedReg),
            ),
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xffebddd3),
      appBar: AppBar(
        title: const Text(
          'Трот-нофелет',
          style: TextStyle(
            fontSize: 24.0,
            color: Color(0xffebddd3),
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff7d5538),
        shadowColor: Colors.transparent,
      ),
      body: Column(
        children: <Widget>[
          _form(),
        ],
      ),
    );
  }
}

