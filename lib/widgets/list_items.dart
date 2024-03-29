import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nofelet/models/item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:nofelet/models/user.dart';
import 'package:nofelet/pages/item_page.dart';
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
        stream: DatabaseService().getItems(null),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Item>? items = snapshot.data;
            return ListView.builder(
              itemCount: items?.length,
              itemBuilder: (context, i) {
                return InkWell(
                  child: Card(
                    key: Key(items![i].id.toString()),
                    elevation: 2.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 9.0, horizontal: 16),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xffecd9cc),),
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
                            // RawMaterialButton(
                            //   onPressed: () {
                            //     Navigator.push(
                            //         context, MaterialPageRoute(
                            //         builder: (context) =>
                            //             ItemPage(id: items[i].id))
                            //     );
                            //   },
                            //   child: const Icon(
                            //     Icons.arrow_forward_ios_rounded,
                            //     size: 30.0,
                            //     color: Color(0xff7d5538),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  onTap: (){
                    Navigator.push(
                        context, MaterialPageRoute(
                        builder: (context) =>
                        ItemPage(id: items[i].id))
                    );
                  },
                );
              },
            );
          }else{
            return Center(child: CircularProgressIndicator());
          }
        }
      );
    }

  }


