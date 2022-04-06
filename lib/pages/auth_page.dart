
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nofelet/models/user.dart';
import 'package:nofelet/pages/main_page.dart';
import 'package:nofelet/pages/registraion_page.dart';
import 'package:validators/validators.dart';
import '../main.dart';
import '../services/utils.dart';
import '../widgets/Button_Widget.dart';
import '../widgets/input.dart';

class AuthPage extends StatefulWidget {

  final VoidCallback onClickedReg;

  const AuthPage({Key? key, required this.onClickedReg}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // bool showLogin = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    dynamic validateEmail(String? value){
      String pattern =
          r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
          r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
          r"{0,253}[a-zA-Z0-9])?)*$";
      RegExp regex = RegExp(pattern);
      (value == null || value.isEmpty || !regex.hasMatch(value))
          ? 'Введите корректный email'
          : null;
    }

    Future<UserPerson?> _buttonEnter() async {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator(),),
      );

        try {
          UserCredential result = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim(),);
          User user = result.user!;
          return UserPerson.fromFirebase(user);
        } on FirebaseAuthException catch (e) {
          print(e);
          Utils.showSnackBar(e.message);
          return null;
        }
      navigatorKey.currentState!.popUntil((route) => route.isFirst);
    }



    Widget _form(){
      return Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 170, bottom: 10),
            child: input("EMAIL", _emailController, false, false, 1, null,(email) => !isEmail(email)
                ? 'Введите корректный email'
                : null),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: input("PASSWORD", _passwordController, true, false, 1, null, null),
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

