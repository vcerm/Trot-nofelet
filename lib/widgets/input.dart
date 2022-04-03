import 'package:flutter/material.dart';

Widget input(String hint, TextEditingController controller, bool obscure, bool expand, final maxLines){

  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: TextField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(10.0),
        hintStyle: const TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 16,
          color: Color(0xffb38f77),
        ),
        hintText: hint,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffb38f77), width: 2),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffb38f77), width: 3),
        ),
      ),
      expands: expand,
      maxLines: maxLines,
      controller: controller,
      obscureText: obscure,
      style: const TextStyle(
        fontSize: 16,
        color: Color(0xff7d5538),
      ),
    ),
  );
}