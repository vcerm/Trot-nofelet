import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nofelet/models/user.dart';
import 'package:nofelet/pages/auth_page.dart';
import 'package:nofelet/pages/item_edit_page.dart';
import 'package:nofelet/pages/item_page.dart';
import 'package:nofelet/pages/landing.dart';
import 'package:nofelet/pages/registraion_page.dart';
import 'package:nofelet/services/auth.dart';
import 'package:nofelet/services/database.dart';
import 'package:nofelet/services/get_stream.dart';
import 'package:nofelet/services/utils.dart';
import 'package:nofelet/widgets/chek_auth_widget.dart';
import 'package:nofelet/pages/main_page.dart';
import 'package:provider/provider.dart';
void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Color(0xffd4b59f),
  ));
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserPerson?>.value(
      value: AuthService().currentUser,
      initialData: null,
      child: MaterialApp(
        scaffoldMessengerKey: messengerKey,
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Inter'),
        home: LandingPage(),
      ),
    );
  }
}


