import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nofelet/pages/auth_page.dart';
import 'package:nofelet/pages/main_page.dart';
import 'package:nofelet/widgets/chek_reg_widget.dart';

class ChekLogin extends StatelessWidget {
  const ChekLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Что-то пошло не так'),);
          } else if (snapshot.hasData) {
            return MainPage();
          }else {
            return ChekReg();
          }
        }
    ),
  );
}
