import 'package:flutter/material.dart';
import 'package:nofelet/models/item_other.dart';
import 'package:nofelet/pages/profile_page.dart';
import 'package:nofelet/widgets/User_Preferences.dart';
import 'package:nofelet/widgets/list_items.dart';

import '../widgets/Button_Widget.dart';
import '../widgets/Profile_Widget.dart';
import '../widgets/Text_Field_Widget.dart';
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
  late final TextEditingController controller;

  @override
  void initState(){
    super.initState();

    controller = TextEditingController(text: item.description);
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    void _buttonSave(){
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ProfilePage()));
    }

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
          SizedBox(height: 10,),
              Flexible(
                  child: SizedBox(
                    width: 350,
                    child: TextField(
                      maxLines: 30,
                      controller: controller,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(10.0),
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                          color: Color(0xffb38f77),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffb38f77), width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffb38f77), width: 3),
                        ),
                      ),
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xff7d5538),
                      ),
                    ),
                  ),
                ),
              Flexible(
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