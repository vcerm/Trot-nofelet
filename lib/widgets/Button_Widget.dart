import 'package:flutter/material.dart';

Widget button(String text, void func()){
  return MaterialButton(
    padding: const EdgeInsets.all(0.0),
    splashColor: const Color(0xffebddd3),
    highlightColor: const Color(0xffebddd3),
    color: const Color(0xffdb9562),
    child: Text(
      text,
      style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          letterSpacing: 2.0,
          color: Color(0xffebddd3)
      ),
    ),
    onPressed: (){
      func();
    },
  );
}
