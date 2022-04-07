import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nofelet/models/item.dart';
import 'package:nofelet/models/user.dart';
import 'package:nofelet/services/database.dart';
import 'package:nofelet/widgets/Add_Button_Widget.dart';
import 'package:nofelet/widgets/Add_Item_Image.dart';
import 'package:nofelet/widgets/input.dart';
import 'package:provider/provider.dart';

class AddItem extends StatefulWidget {
  final Item? item;

  const AddItem({Key? key, this.item}) : super(key: key);

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {

  final _description = TextEditingController();
  late UserPerson user;
  late UserData? userData;
  Item itemEdit = Item();


  @override
  void initState() {
    if (widget.item != null) itemEdit = widget.item!.copy();
    super.initState();
  }


  void _saveButton() async {

    itemEdit.author = 'author_name';
    itemEdit.authorId = user.id;
    itemEdit.description = _description.text.trim();


    await DatabaseService().addOrUpdateItem(itemEdit);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    user = Provider.of<UserPerson>(context);

        return Scaffold(
          backgroundColor: const Color(0xffebddd3),
          appBar: AppBar(
            title: const Text(
              'Добавление',
              style: TextStyle(
                fontSize: 24.0,
                color: Color(0xffebddd3),
              ),
            ),
            centerTitle: true,
            backgroundColor: const Color(0xff7d5538),
            shadowColor: Colors.transparent,
            leading: RawMaterialButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_rounded,
                size: 30.0,
                color: Color(0xffebddd3),
              ),
            ),
          ),
          body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: addImage(),
                ),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return SizedBox(
                          height: constraints.maxHeight / 9,
                          child: input('Описание', _description, false, true, null, null, null)
                        );
                      }),
                    ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: addButton(_saveButton),
                )
              ],
            ),
        );
      }
  }
