import 'package:flutter/material.dart';
import 'package:nofelet/models/item_other.dart';
import 'package:nofelet/widgets/User_Preferences.dart';
import 'package:nofelet/widgets/list_items.dart';

import '../widgets/Profile_Widget.dart';
import '../widgets/User_Items_Widget.dart';
import '../models/item.dart';
import '../widgets/Item_Widget.dart';
import 'main_page.dart';
import '../widgets/Item_Widget.dart';
import '../widgets/Item_Preferences.dart';

class ItemEditPage extends StatefulWidget {
  const ItemEditPage({Key? key}) : super(key: key);

  @override
  _ItemEditPageState createState() => _ItemEditPageState();
}

final user = UserPreferences.myUser;
final item = ItemPreferences.item;

class _ItemEditPageState extends State<ItemEditPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xffebddd3),
      appBar: AppBar(
        title: const Text(
          'Редактирование',
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
            Icons.arrow_back,
            size: 30.0,
            color: Color(0xffebddd3),
          ),
        ),
      ),
      body:
      Column(
        children: [
          ItemWidget(
            ImagePath: item.photo,
            Name: user.name,
            Email: user.email,
          ),
          Container(
              padding: EdgeInsets.symmetric(vertical: 9.0, horizontal: 16),
              child: Text(item.description)
          )
        ],
      ),
    );

  }
}