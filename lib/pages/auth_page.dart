import 'package:flutter/material.dart';
import 'package:nofelet/pages/main_page.dart';
import 'package:nofelet/pages/registraion_page.dart';

import '../widgets/input.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late String _email;
  late String _password;
  // bool showLogin = true;

  @override
  Widget build(BuildContext context) {

    Widget _button(String text, void func()){
      return MaterialButton(
        padding: const EdgeInsets.all(0.0),
        splashColor: const Color(0xffebddd3),
        highlightColor: const Color(0xffebddd3),
        color: const Color(0xffdb9562),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            letterSpacing: 2.0,
            color: Color(0xffebddd3)
          ),
        ),
        onPressed: (){
          func();
        },
      );
    }

    void _buttonEnter(){
      _email = _emailController.text;
      _password = _passwordController.text;

      _emailController.clear();
      _passwordController.clear();

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MainPage()));
    }

    void _buttonReg(){
      _email = _emailController.text;
      _password = _passwordController.text;

      _emailController.clear();
      _passwordController.clear();

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Register()));
    }

    Widget _form(){
      return Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 170, bottom: 10),
            child: input("EMAIL", _emailController, false),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: input("PASSWORD", _passwordController, true),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: SizedBox(
              height: 40,
              width: 150,
              child: _button("Войти", _buttonEnter),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: SizedBox(
              height: 40,
              width: 150,
              child: _button("Регистрация", _buttonReg),
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

