import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nofelet/models/user.dart';
import 'package:nofelet/pages/add_page.dart';
import 'package:nofelet/pages/profile_page.dart';
import 'package:nofelet/widgets/UserItemsEditWidget.dart';
import 'package:nofelet/widgets/edit_profile_widget.dart';
import 'package:provider/provider.dart';

import '../models/item.dart';
import '../services/database.dart';
import '../widgets/Button_Widget.dart';
import '../widgets/Text_Field_Widget.dart';
import '../widgets/User_Items_Widget.dart';
import '../widgets/User_Preferences.dart';

class ProfileEdit extends StatefulWidget {
  ProfileEdit({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  _ProfileEditState createState() => _ProfileEditState();
}



class _ProfileEditState extends State<ProfileEdit> {


  late UserPerson user;
  DatabaseService db = DatabaseService();
  StreamSubscription<List<Item>>? itemsStreamSubscription;

  @override
  void dispose() {
    if(itemsStreamSubscription != null){
      print('Unsubscribing');
      itemsStreamSubscription?.cancel();
    }
    super.dispose();
  }

  _buttonSave(String? name, String? email)async{
    await DatabaseService().updateUserData(name, email);
    Navigator.pop(context);
  }

  
  @override
  Widget build(BuildContext context) {

    user = Provider.of<UserPerson>(context);


    return StreamBuilder<UserData>(
      stream: DatabaseService().userData,
      builder: (context, snapshot) {
        if(snapshot.hasData){
          UserData? userData = snapshot.data;
          widget.nameController.text = userData!.name!;
          widget.emailController.text = userData.email!;
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
                    width: 220,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 10.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: TextField(
                              maxLines: 1,
                              controller: widget.nameController,
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
                          Expanded(
                            child: Text(
                              userData.email!,
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Color(0xff7d5538),),
                            ),
                          ),
                        ],
                      ),
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
                  child: UserItemsEdit(AuthorId: user.id),
                ),
              ),
              Flexible(
                fit: FlexFit.loose,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: SizedBox(
                    height: 40,
                    width: 150,
                    child: MaterialButton(
                      padding: const EdgeInsets.all(0.0),
                      splashColor: const Color(0xffebddd3),
                      highlightColor: const Color(0xffebddd3),
                      color: const Color(0xffdb9562),
                      child: const Text(
                        'Сохранить',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            letterSpacing: 2.0,
                            color: Color(0xffebddd3)
                        ),
                      ),
                      onPressed: (){
                        _buttonSave(widget.nameController.text.trim(), userData.email);
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
