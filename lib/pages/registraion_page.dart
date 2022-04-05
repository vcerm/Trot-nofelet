
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nofelet/main.dart';
import 'package:nofelet/pages/profile_page.dart';
import 'package:nofelet/services/utils.dart';
import 'package:nofelet/widgets/Add_Button_Widget.dart';
import 'package:nofelet/widgets/Button_Widget.dart';
import 'package:validators/validators.dart';
import '../widgets/UserItemsEditWidget.dart';
import '../widgets/User_Items_Widget.dart';
import '../widgets/input.dart';
import 'package:nofelet/pages/add_page.dart';
import 'main_page.dart';

class Register extends StatefulWidget {
  final Function() onClickedAuth;

  const Register({Key? key, required this.onClickedAuth}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordChekController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _passwordChekController.dispose();
    _nameController.dispose();
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

    Future _buttonReg() async{
      final isValid = formKey.currentState!.validate();
      if(!isValid) return;

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator(),),
      );

      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
      } on FirebaseAuthException catch (e) {
        print(e);

        Utils.showSnackBar(e.message);
      }

      navigatorKey.currentState!.popUntil((route) => route.isFirst);
    }

    void addButtonRoute(){
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AddItem()));
    }

    return Scaffold(
      backgroundColor: const Color(0xffebddd3),
      appBar: AppBar(
          title: const Text(
            'Регистрация',
            style: TextStyle(
              fontSize: 24.0,
              color: Color(0xffebddd3),
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xff7d5538),
          shadowColor: Colors.transparent,
          leading: RawMaterialButton(
            onPressed: widget.onClickedAuth,
            child: const Icon(
              Icons.arrow_back_rounded,
              size: 30.0,
              color: Color(0xffebddd3),
            ),
          ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(top: 10.0),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    Container(
                      child: Image.asset(
                        'assets/images/profile_logo.png',
                        width: 150,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 26),
                      child: Image.asset(
                        'assets/images/download.png',
                        width: 60,
                      ),
                    ),
                  ],
                )
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: input('Имя', _nameController, false, false, 1, null),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: input('Email', _emailController, false, false, 1, (email) => !isEmail(email)
                    ? 'Введите корректный email'
                    : null),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: input('Пароль', _passwordController, true, false, 1, (value) =>
                value != null && value.length < 6
                    ? 'Слишком короткий пароль'
                    : null),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: input('Повторите пароль', _passwordChekController, true, false, 1, (value) =>
                value.isEmpty || (value != null && value != _passwordController.text)
                    ? 'Пароли отличаются'
                    : null),
              ),
              SizedBox(
                height: 170,
                child: UserItemsEdit(items: user.items, bottomButton: addButton(addButtonRoute),),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: SizedBox(
                  height: 40,
                  width: 195,
                  child: button('Регистрация', _buttonReg),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
