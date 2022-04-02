import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nofelet/widgets/list_items.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Трот-нофелет',
          style: TextStyle(
              fontSize: 24.0,
              color: Color(0xffebddd3),
          ),
        ),
        centerTitle: true,
        // automaticallyImplyLeading: false,
        leading: RawMaterialButton(
          onPressed: () {
            if(_scaffoldKey.currentState!.isDrawerOpen){
              _scaffoldKey.currentState?.openEndDrawer();
            } else{
              _scaffoldKey.currentState?.openDrawer();
            }
          },
          child: const Icon(
            Icons.menu,
            size: 30.0,
            color: Color(0xffebddd3),
          ),
        ),
        backgroundColor: const Color(0xff7d5538),
        shadowColor: Colors.transparent,
      ),
      body: Scaffold(
        backgroundColor: const Color(0xffebddd3),
        drawerEnableOpenDragGesture: false,
        key: _scaffoldKey,
        body: ItemList(),
        drawer: Drawer(
          backgroundColor: const Color(0xffd4b59f),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 20.0),
                child: Column(
                  children: [
                    Row(
                      children: const [
                         Text(
                            'Сахаристые изделия',
                            style: TextStyle(
                              // fontStyle: FontStyle.normal,
                              color: Color(0xff7d5538),
                              fontSize: 14.0,
                              letterSpacing: 3.0,
                            ),
                          ),
                      ],
                    ),
                    Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(top: 8.0),
                          child: Text(
                            'Безе',
                            style: TextStyle(
                              // fontStyle: FontStyle.normal,
                              color: Color(0xff7d5538),
                              fontSize: 14.0,
                              letterSpacing: 3.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(top: 8.0),
                          child: Text(
                            'Мармелад',
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              color: Color(0xff7d5538),
                              fontSize: 14.0,
                              letterSpacing: 3.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}