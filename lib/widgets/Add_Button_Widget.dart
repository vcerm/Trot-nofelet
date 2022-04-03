import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nofelet/widgets/Button_Widget.dart';

Widget addButton(){
  return SizedBox(
    width: 60,
    child: button('Добавить', (){}),
  );
}