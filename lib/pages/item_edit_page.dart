import 'package:flutter/material.dart';
import 'package:nofelet/models/item_other.dart';
import 'package:nofelet/models/user.dart';
import 'package:nofelet/pages/profile_page.dart';
import 'package:nofelet/widgets/User_Preferences.dart';
import 'package:nofelet/widgets/list_items.dart';
import 'package:provider/provider.dart';

import '../services/database.dart';
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

  final String? id;

  ItemEditPage({Key? key, required this.id}) : super(key: key);
  final TextEditingController controller = TextEditingController();


  @override
  _ItemEditPageState createState() => _ItemEditPageState();
}

class _ItemEditPageState extends State<ItemEditPage> {

  late UserPerson user;
  Item? item;
  var db = DatabaseService();


  @override
  void initState(){
    super.initState();
  }

  _buttonSave(Item? itemEdit)async{
    itemEdit?.description = widget.controller.text.trim();
    itemEdit?.authorId = user.id;
    await DatabaseService().addOrUpdateItem(itemEdit!);
    Navigator.pop(context);
  }

  @override
  void dispose() {
    widget.controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    user = Provider.of<UserPerson>(context);

    return StreamBuilder<Item>(
      stream: DatabaseService(uid: widget.id).getItemById,
      builder: (context, snapshot) {
        if(snapshot.hasData){
          Item? item = snapshot.data;
          String? AuthorName = item?.author;
          widget.controller.text = item!.description!;
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
                ImagePath: 'assets/images/item_image.png',
                Name: AuthorName,
                Email: user?.email,
              ),
              SizedBox(height: 10,),
                  Flexible(
                      child: SizedBox(
                        width: 350,
                        child: TextField(
                          maxLines: 30,
                          controller: widget.controller,
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
                        child: MaterialButton(
                          padding: const EdgeInsets.all(0.0),
                          splashColor: const Color(0xffebddd3),
                          highlightColor: const Color(0xffebddd3),
                          color: const Color(0xffdb9562),
                          child: Text(
                            'Сохранить',
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                letterSpacing: 2.0,
                                color: Color(0xffebddd3)
                            ),
                          ),
                          onPressed: (){
                            _buttonSave(item);
                          },
                        ),
                      ),
                    ),
                  ),
            ],
          ),
        );
      }else{
          return CircularProgressIndicator();
        }
      }
    );

  }
}