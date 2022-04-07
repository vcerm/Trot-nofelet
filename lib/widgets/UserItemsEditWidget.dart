import 'package:flutter/material.dart';
import 'dart:async';
import '../models/item.dart';
import '../pages/add_page.dart';
import '../services/database.dart';

class UserItemsEdit extends StatefulWidget {

  // final List<Item> items;
  final String? AuthorId;

  const UserItemsEdit({Key? key, required this.AuthorId}) : super(key: key);

  @override
  State<UserItemsEdit> createState() => _UserItemsEditState();
}

class _UserItemsEditState extends State<UserItemsEdit> {
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


  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Item>>(
      stream: DatabaseService().getItems(widget.AuthorId),
      builder: (context, snapshot) {
        if(snapshot.hasData){
          List<Item>? items = snapshot.data;
        return ListView.builder(
          itemCount: items!.length+1,
          itemBuilder: (context, int i){
            if(i == items.length){
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 10.0),
                child: MaterialButton(
                    padding: const EdgeInsets.all(0.0),
                    splashColor: const Color(0xffebddd3),
                    highlightColor: const Color(0xffebddd3),
                    color: const Color(0xffdb9562),
                    child: Text(
                      'Добавить',
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          letterSpacing: 2.0,
                          color: Color(0xffebddd3)
                      ),
                    ),
                    onPressed: (){
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => AddItem()));
                    }),
              );
            }
            return Card(
              elevation: 2,
              margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
              child: Container(
                decoration: const BoxDecoration(color: Color(0xffecd9cc),),
                child: ListTile(
                  leading: Image.asset(
                    'assets/images/item_image.png',
                    fit: BoxFit.fill,
                  ),
                  contentPadding: const EdgeInsets.all(6.0),
                  title: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      items[i].description.toString(),
                      style: const TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  ),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        items[i].author.toString(),
                        style: const TextStyle(
                          letterSpacing: 3.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    RawMaterialButton(
                      onPressed: () {
                        db.deleteItem(items[i]);
                      },
                      child: const Icon(
                        Icons.delete,
                        size: 30.0,
                        color: Colors.black,
                      ),
                    ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }else{
          return CircularProgressIndicator();
        }
      }
    );
  }
}
