import 'package:flutter/material.dart';
import 'package:nofelet/pages/auth_page.dart';
import 'package:nofelet/pages/registraion_page.dart';

class ChekReg extends StatefulWidget {
  const ChekReg({Key? key}) : super(key: key);

  @override
  State<ChekReg> createState() => _ChekRegState();
}

class _ChekRegState extends State<ChekReg> {
  bool isLogin = true;
  
  @override
  Widget build(BuildContext context) => isLogin
      ? AuthPage(onClickedReg: toggle)
      : Register(onClickedAuth: toggle);

  void toggle() => setState(() => isLogin = !isLogin);
}
