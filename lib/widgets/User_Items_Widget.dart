import 'package:flutter/material.dart';
import 'package:nofelet/pages/item_edit_page.dart';

import '../models/item.dart';

class UserItemsWidget extends StatelessWidget {

  final List<Item> items;
  final Widget bottomButton;

  const UserItemsWidget({Key? key, required this.items, required this.bottomButton}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length+1,
      itemBuilder: (context, int i){
        if(i == items.length){
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 100),
            child: bottomButton,
          );
        }
        return Card(
          elevation: 2,
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
                  RawMaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => ItemEditPage())
                      );
                    },
                    child: const Icon(
                      Icons.edit,
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

  }
 }

