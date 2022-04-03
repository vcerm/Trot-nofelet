import 'package:flutter/material.dart';
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

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {

    final user = UserPreferences.myUser;

    Widget _button(String text){
      return MaterialButton(
        padding: const EdgeInsets.all(0.0),
        splashColor: const Color(0xffebddd3),
        highlightColor: const Color(0xffebddd3),
        color: const Color(0xffdb9562),
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              letterSpacing: 2.0,
              color: Color(0xffebddd3)
          ),
        ),
        onPressed: (){
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MainPage()));
        },
      );
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
                Divider(
                  color: Colors.black,
                  height: 20,
                  thickness: 2,
                  indent: 10,
                  endIndent: 10,
                ),
                Container(
                  height: 400,
                  child: UserItemsWidget(items: user.items),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30.0),
                  child: SizedBox(
                    height: 40,
                    width: 150,
                    child: _button("Выйти"),
                  ),
                ),
              ],
        ),
    );

  }
}
