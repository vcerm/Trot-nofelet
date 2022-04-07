import 'package:flutter/material.dart';
import 'package:nofelet/models/item_other.dart';
import 'package:nofelet/models/user.dart';
import 'package:nofelet/services/database.dart';
import 'package:provider/provider.dart';
import '../models/item.dart';
import '../widgets/Item_Widget.dart';
import 'item_edit_page.dart';
import 'main_page.dart';
import '../widgets/Item_Widget.dart';
import '../widgets/Item_Preferences.dart';

class ItemPage extends StatefulWidget {

  final String? id;

  const ItemPage({Key? key, required this.id}) : super(key: key);

  @override
  _ItemPageState createState() => _ItemPageState();
}


class _ItemPageState extends State<ItemPage> {
  UserPerson? user;
  var db = DatabaseService();
  @override

  void initState(){
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    user = Provider.of<UserPerson>(context);
    print(widget.id);
    return StreamBuilder<Item>(
      stream: DatabaseService(uid: widget.id).getItemById,
      builder: (context, snapshot) {
        print(snapshot.data);
        if(snapshot.hasData){
          Item? item = snapshot.data;
          String? desc = item?.description;
          String? AuthName = item?.author;
        return Scaffold(
          backgroundColor: const Color(0xffebddd3),
          appBar: AppBar(
            title: const Text(
              'Торты, капкейки на заказ',
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
                Name: AuthName,
                Email: user?.email,
              ),
              Container(
               padding: EdgeInsets.symmetric(vertical: 9.0, horizontal: 16),
                child: Text(desc!),
              )
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