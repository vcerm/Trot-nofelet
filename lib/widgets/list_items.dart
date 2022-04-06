import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nofelet/models/item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:nofelet/models/user.dart';
import 'package:nofelet/services/database.dart';

class ItemList extends StatefulWidget {
  const ItemList({Key? key,}) : super(key: key);

  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {

  var db = DatabaseService();
  StreamSubscription<List<Item>>? itemsStreamSubscription;
  late List<Item> items;

  @override
  void dispose() {
    if(itemsStreamSubscription != null){
      print('Unsubscribing');
      itemsStreamSubscription?.cancel();
    }
    super.dispose();
  }

  Future<void> loadData() async{
    var stream = db.getItems(null);

    itemsStreamSubscription = stream.listen((List<Item> data) {
      setState(() {
        items = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    loadData();
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, i){
        return Container(
          child: Card(
            // key: Key(items[i].id!),
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
                    items[i].description!,
                    style: const TextStyle(
                      fontSize: 13,
                    ),
                  ),
                ),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      items[i].author!,
                      style: const TextStyle(
                        letterSpacing: 3.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '№' + items[i].id!,
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

