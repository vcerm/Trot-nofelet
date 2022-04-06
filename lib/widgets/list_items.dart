import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nofelet/models/item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:nofelet/models/user.dart';
import 'package:nofelet/services/database.dart';

class ItemList extends StatefulWidget {
  final Item? item;
  const ItemList({Key? key, this.item}) : super(key: key);

  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  late UserPerson user;

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
      itemCount: items.length,
      itemBuilder: (context, i){
        return Container(
          child: Card(
            key: Key(items[i].id.toString()),
            elevation: 2.0,
            margin: const EdgeInsets.symmetric(vertical: 9.0, horizontal: 16),
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
                    Text(
                      '№' + items[i].id.toString(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

