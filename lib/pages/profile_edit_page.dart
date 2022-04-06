import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nofelet/models/user.dart';
import 'package:nofelet/pages/add_page.dart';
import 'package:nofelet/pages/profile_page.dart';
import 'package:nofelet/widgets/UserItemsEditWidget.dart';
import 'package:nofelet/widgets/edit_profile_widget.dart';

import '../models/item.dart';
import '../services/database.dart';
import '../widgets/Button_Widget.dart';
import '../widgets/Text_Field_Widget.dart';
import '../widgets/User_Items_Widget.dart';
import '../widgets/User_Preferences.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({Key? key}) : super(key: key);

  @override
  _ProfileEditState createState() => _ProfileEditState();
}

late UserPerson user;

class _ProfileEditState extends State<ProfileEdit> {

  DatabaseService db = DatabaseService();
  StreamSubscription<List<Item>>? itemsStreamSubscription;
  late List<Item> items;

  @override
  void dispose() {
    if(itemsStreamSubscription != null){
      print('Unsubscribing');
      itemsStreamSubscription?.cancel();
    }
    super.dispose();
  }

  Future<void> loadData() async{
    var stream = db.getItems(null);

    itemsStreamSubscription = stream.listen((List<Item> data) {
      setState(() {
        items = data;
      });
    });
  }
  @override
  Widget build(BuildContext context) {

    void _buttonSave(){
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ProfilePage()));
    }

    void _buttonAdd(){
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AddItem()));
    }

    Widget _Addbutton() => button('Добавить', _buttonAdd);

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
        leading: BackButton(color: Color(0xffebddd3)),
        ),
      body: Column(
        children: [
          Row(
            children: [
              EditProfile(
                imagePath: 'assets/images/User_image.jpg',
                onClicked: () async {},
              ),
              const VerticalDivider(width: 15, thickness: 0,),
              SizedBox(
                height: 200,
                width: 200,
                child: Column(
                  children: [
                    const SizedBox(height: 10,),
                    Expanded(
                      child: TextFieldWidget(
                        minLines: 1,
                        label: 'Имя',
                        text: 'Потный Вилли',
                        onChanged: (name) {},
                      ),
                    ),
                    Expanded(
                      child: TextFieldWidget(
                        minLines: 1,
                        label: 'Email',
                        text: user.email!,
                        onChanged: (email) {},
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          const Divider(
            color: Colors.black,
            height: 20,
            thickness: 2,
            indent: 10,
            endIndent: 10,
          ),
          Flexible(
            fit: FlexFit.loose,
            flex: 5,
            child: SizedBox(
              height: 450,
              child: UserItemsEdit(items: items, bottomButton: _Addbutton()),
            ),
          ),
          Flexible(
            fit: FlexFit.loose,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: SizedBox(
                height: 50,
                width: 150,
                child: button("Сохранить", _buttonSave),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
