import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  final String ImagePath;
  final String Name;
  final String? Email;

  const ItemWidget(
      {Key? key, required this.ImagePath, required this.Name, required this.Email})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 15, top: 15),
          child: buildImage(),
        ),
        Container(
          padding: const EdgeInsets.only(left: 30.0, top: 20),
          child: Column(
            children: [
              Text(
                Name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Color(0xff64442d),),
              ),
              Text(
                Email!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  color: Color(0xff7d5538),),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildImage() {
    final image = Image.asset(ImagePath);
    return ClipPath(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image.image,
          fit: BoxFit.cover,
          width: 150,
          height: 150,
        ),
      ),
    );
  }

}