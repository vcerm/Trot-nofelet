import 'package:flutter/material.dart';
import 'package:nofelet/models/item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class itemList extends StatefulWidget {
  const itemList({Key? key}) : super(key: key);

  @override
  _itemListState createState() => _itemListState();
}

class _itemListState extends State<itemList> {

  void initFirebase() async{
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }

  @override
  void initState(){
    super.initState();

    initFirebase();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, i){
        return Container(
          child: Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 9.0, horizontal: 16),
            child: Container(
              decoration: const BoxDecoration(color: Color(0xffecd9cc),),
              child: ListTile(
                leading: Image.asset(
                  items[i].photo,
                  fit: BoxFit.fill,
                ),
                contentPadding: const EdgeInsets.all(6.0),
                title: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    items[i].description,
                    style: const TextStyle(
                      fontSize: 13,
                    ),
                  ),
                ),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      items[i].author,
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

