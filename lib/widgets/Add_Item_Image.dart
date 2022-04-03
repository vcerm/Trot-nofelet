import 'package:flutter/material.dart';

Widget addImage(){
  return Container(
    padding: const EdgeInsets.only(top: 5.0),
    height: 150,
    width: 200,
    decoration: BoxDecoration(
      border: Border.all(
        color: const Color(0xffD4B59F),
        width: 3.0,
      ),
    ),
    child: Column(
      children: [
        const Text(
          'Загрузить изображение',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: Color(0xff7d5538),
            letterSpacing: 2.0,
          ),
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Image.asset(
            'assets/images/download.png',
            width: 60,
          ),
        ),
      ],
    ),
  );
}