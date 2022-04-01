import 'package:flutter/material.dart';

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
  bool showLogin = true;

  @override
  Widget build(BuildContext context) {

    Widget _input(String hint, TextEditingController controller, bool obscure){
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          decoration: InputDecoration(
            hintStyle: const TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 16,
                color: Color(0xffb38f77),
            ),
            hintText: hint,
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffb38f77), width: 2)
            ),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffb38f77), width: 3)
            ),
          ),
          controller: controller,
          obscureText: obscure,
          style: const TextStyle(
            fontSize: 16,
            color: Color(0xff7d5538),
          ),
        ),
      );
    }

    Widget _button(String text, void func()){
      return MaterialButton(
        splashColor: const Color(0xffebddd3),
        highlightColor: const Color(0xffebddd3),
        color: const Color(0xffdb9562),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            letterSpacing: 5.0,
            color: Color(0xffebddd3)
          )
        ),
        onPressed: (){
          func();
        },
      );
    }

    Widget _form(String label, void func()){
      return Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 170, bottom: 20),
              child: _input("EMAIL", _emailController, false),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: _input("PASSWORD", _passwordController, true),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: SizedBox(
                height: 40,
                width: 150,
                child: _button(label, func),
              ),
            ),
          ],
        ),
      );
    }

    void _buttonAction(){
      _email = _emailController.text;
      _password = _passwordController.text;

      _emailController.clear();
      _passwordController.clear();
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
          _form("Войти",_buttonAction),
        ],
      ),
    );
  }
}

