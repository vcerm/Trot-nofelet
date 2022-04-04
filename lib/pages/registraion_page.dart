import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nofelet/pages/profile_page.dart';
import 'package:nofelet/widgets/Add_Button_Widget.dart';
import 'package:nofelet/widgets/Button_Widget.dart';
import '../widgets/UserItemsEditWidget.dart';
import '../widgets/User_Items_Widget.dart';
import '../widgets/input.dart';
import 'package:nofelet/pages/add_page.dart';
import 'main_page.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordChekController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    void _buttonReg(){
      if(_passwordController.text == _passwordChekController.text){
        _passwordController.clear();
        _nameController.clear();
        _emailController.clear();
        _passwordChekController.clear();

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MainPage()));
      } else {
        _passwordController.clear();
        _passwordChekController.clear();
      }
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
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_rounded,
              size: 30.0,
              color: Color(0xffebddd3),
            ),
          ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 20.0, bottom: 10),
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
            child: input('Имя', _nameController, false, false, 1),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: input('Email', _emailController, false, false, 1),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: input('Пароль', _passwordController, true, false, 1),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: input('Повторите пароль', _passwordChekController, true, false, 1),
          ),
          Flexible(
            fit: FlexFit.loose,
            flex: 3,
            child: SizedBox(
              height: 170,
              child: UserItemsEdit(items: user.items, bottomButton: addButton(addButtonRoute),),
            ),
          ),
          Flexible(
            fit: FlexFit.loose,
            // flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: SizedBox(
                height: 40,
                width: 195,
                child: button('Регистрация', _buttonReg),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
