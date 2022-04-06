import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nofelet/models/user.dart';
import 'package:nofelet/pages/auth_page.dart';
import 'package:nofelet/pages/main_page.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserPerson user = Provider.of<UserPerson>(context);
    final bool isLoggedIn = user != null;

    return isLoggedIn ? MainPage() : AuthPage(onClickedReg: () {},);
  }
}
