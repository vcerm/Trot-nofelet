import 'package:flutter/material.dart';
import 'package:nofelet/widgets/Button_Widget.dart';

Widget addButton(void func()){
  return SizedBox(
    width: 60,
    child: button('Добавить', func),
  );
}
