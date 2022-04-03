import 'package:flutter/material.dart';
import 'package:nofelet/widgets/Button_Widget.dart';

Widget addButton(void func()){
  return SizedBox(
    height: 50,
    width: 150,
    child: button('Добавить', func),
  );
}
