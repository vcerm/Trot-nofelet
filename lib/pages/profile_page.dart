import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nofelet/pages/auth_page.dart';
import 'package:nofelet/pages/profile_edit_page.dart';
import 'package:nofelet/widgets/Button_Widget.dart';
import 'package:nofelet/widgets/User_Preferences.dart';
import 'package:nofelet/widgets/list_items.dart';

import '../widgets/Profile_Widget.dart';
import '../widgets/User_Items_Widget.dart';
import 'main_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

final user = UserPreferences.myUser;

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {

    void _buttonExit(){
      FirebaseAuth.instance.signOut();
    }


    return Scaffold(
      backgroundColor: const Color(0xffebddd3),
      appBar: AppBar(
        title: const Text(
          'Профиль',
          style: TextStyle(
            fontSize: 24.0,
            color: Color(0xffebddd3),
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff7d5538),
        shadowColor: Colors.transparent,
        leading: RawMaterialButton(
          onPressed: (){
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MainPage()));
          },
          child: const Icon(
            Icons.house_rounded,
            size: 30.0,
            color: Color(0xffebddd3),
          ),
        ),

        actions: [
          RawMaterialButton(
              onPressed: (){
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => ProfileEdit()));
              },
              child: const Icon(
                Icons.edit,
                size: 30.0,
                color: Color(0xffebddd3),
              ),
          ),
        ],
      ),
      body:
        Column(
              children: [
                ProfileWidget(
                  ImagePath: user.photo,
                  Name: user.name,
                  Email: user.email,
                ),
                const Divider(
                  color: Colors.black,
                  height: 20,
                  thickness: 2,
                  indent: 10,
                  endIndent: 10,
                ),
                Container(
                  height: 400,
                  child: UserItemsWidget(items: user.items, bottomButton: Container(),),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30.0),
                  child: SizedBox(
                    height: 40,
                    width: 150,
                    child: button("Выйти", _buttonExit),
                  ),
                ),
              ],
        ),
    );

  }
}
