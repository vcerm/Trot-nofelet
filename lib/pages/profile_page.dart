import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:nofelet/models/user.dart';
import 'package:nofelet/pages/profile_edit_page.dart';
import 'package:provider/provider.dart';
import '../models/item.dart';
import '../services/database.dart';
import '../widgets/Profile_Widget.dart';
import '../widgets/User_Items_Widget.dart';
import 'main_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}



class _ProfilePageState extends State<ProfilePage> {
  UserPerson? user;
  DatabaseService db = DatabaseService();
  StreamSubscription<List<Item>>? itemsStreamSubscription;


  @override
  void dispose() {
    if(itemsStreamSubscription != null){
      log('Unsubscribing');
      itemsStreamSubscription?.cancel();
    }
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    user = Provider.of<UserPerson?>(context);


    return StreamBuilder<UserData>(
      stream: DatabaseService().userData,
      builder: (context, snapshot) {
        if(snapshot.hasData){
          UserData? userData = snapshot.data;
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
            SingleChildScrollView(
              child: Column(
                    children: [
                      ProfileWidget(
                        ImagePath: 'assets/images/User_image.jpg',
                        Name: userData!.name!,
                        Email: userData.email!,
                      ),
                      const Divider(
                        color: Colors.black,
                        height: 20,
                        thickness: 2,
                        indent: 10,
                        endIndent: 10,
                      ),
                      SizedBox(
                        height: 400,
                        child: UserItemsWidget(bottomButton: Container(), AuthorId: user!.id,),
                      ),
                    ],
              ),
            ),
        );
      }else{
          return const Center(child: CircularProgressIndicator());
        }
      }
    );

  }
}
