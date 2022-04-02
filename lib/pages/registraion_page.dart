import 'package:flutter/material.dart';
import '../widgets/input.dart';

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
          onPressed: (){Navigator.pop(context);},
          child: const Icon(
            Icons.arrow_back_rounded,
            size: 30.0,
            color: Color(0xffebddd3),
          ),
        )
      ),
      body: Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 10),
                    child: Image.asset(
                      'assets/images/profile_logo.png',
                      width: 150,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: input('Имя', _nameController, false),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: input('Email', _emailController, false),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: input('Пароль', _passwordController, true),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: input('Повторите пароль', _passwordChekController, true),
                  ),
                ],
              ),

    );
  }
}
