import 'package:flutter/material.dart';
import 'package:nofelet/pages/main_page.dart';
import 'package:nofelet/pages/registraion_page.dart';
import '../widgets/Button_Widget.dart';
import '../widgets/input.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // bool showLogin = true;

  @override
  Widget build(BuildContext context) {

    void _buttonAction(){

      _emailController.clear();
      _passwordController.clear();
    }

    void _buttonEnter(){
      _buttonAction();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MainPage()));
    }

    void _buttonReg(){
      _buttonAction();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Register()));
    }

    Widget _form(){
      return Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 170, bottom: 10),
            child: input("EMAIL", _emailController, false, false, 1),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: input("PASSWORD", _passwordController, true, false, 1),
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
              child: button("Регистрация", _buttonReg),
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

