import 'package:flutter/material.dart';
import 'dart:async';
import '../models/item.dart';
import '../services/database.dart';

class UserItemsEdit extends StatefulWidget {

  // final List<Item> items;
  final Widget bottomButton;

  const UserItemsEdit({Key? key, required this.bottomButton}) : super(key: key);

  @override
  State<UserItemsEdit> createState() => _UserItemsEditState();
}

class _UserItemsEditState extends State<UserItemsEdit> {
  DatabaseService db = DatabaseService();
  StreamSubscription<List<Item>>? itemsStreamSubscription;

  @override
  void initState(){
    loadData();
    super.initState();
  }

  var items = <Item>[];

  @override
  void dispose() {
    if(itemsStreamSubscription != null){
      print('Unsubscribing');
      itemsStreamSubscription?.cancel();
    }
    super.dispose();
  }

  loadData() async{
    var stream = db.getItems(null);
    stream.listen((List<Item> data) {
      setState(() {
        items = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length+1,
      itemBuilder: (context, int i){
        if(i == items.length){
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 10.0),
            child: widget.bottomButton,
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
                  Icon(Icons.delete),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
