import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nofelet/pages/add_page.dart';
import 'package:nofelet/pages/auth_page.dart';
import 'package:nofelet/pages/profile_page.dart';
import 'package:nofelet/services/auth.dart';
import 'package:nofelet/widgets/list_items.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import '../models/item.dart';
import '../services/database.dart';

class MainPage extends StatefulWidget {

  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    
    // Widget _category(List<Item> item){
    //   dynamic categories = [];
    //   return Column();
    // }
    
    final String imageHolder = 'assets/images/item_image.png';

    return Scaffold(
      backgroundColor: const Color(0xffebddd3),
      appBar: AppBar(
        title: const Text(
          'Трот-нофелет',
          style: TextStyle(
              fontSize: 24.0,
              color: Color(0xffebddd3),
          ),
        ),
        centerTitle: true,
        leading: RawMaterialButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => ProfilePage())
            );
          },
          child: const Icon(
            Icons.person_outline_rounded,
            size: 30.0,
            color: Color(0xffebddd3),
          ),
        ),
        actions: [
          RawMaterialButton(
            onPressed: () {
              AuthService().logOut();
              Navigator.push(context, MaterialPageRoute(builder: (ctx) => AuthPage(onClickedReg: (){})));
            },
            child: const Icon(
              Icons.exit_to_app,
              size: 30.0,
              color: Color(0xffebddd3),
            ),
          )
        ],

        backgroundColor: const Color(0xff7d5538),
        shadowColor: Colors.transparent,
      ),
      body: ItemList()
    );
  }
}