import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {

  final int minLines;
  final String label;
  final String text;
  final ValueChanged<String> onChanged;

  const TextFieldWidget({Key? key, required this.label, required this.text, required this.onChanged, required this.minLines}) : super(key: key);

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  late final TextEditingController controller;

  @override
  void initState(){
    super.initState();

    controller = TextEditingController(text: widget.text);
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Row(
        children: [
          const Icon(Icons.edit, color: Color(0xff7d5538),),
          Text(
            widget.label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Color(0xff7d5538),),
          ),
        ],
      ),
      const SizedBox(height: 5,),
      TextField(
        minLines: widget.minLines,
        maxLines: 30,
        controller: controller,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(10.0),
          hintStyle: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 16,
            color: Color(0xffb38f77),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffb38f77), width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffb38f77), width: 3),
          ),
        ),
        style: const TextStyle(
          fontSize: 16,
          color: Color(0xff7d5538),
        ),
      ),
    ],
  );
}
