import 'package:flutter/material.dart';

class EditProfile extends StatelessWidget {
  final VoidCallback onClicked;
  final String imagePath;

  const EditProfile({Key? key, required this.onClicked, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        Container(padding: const EdgeInsets.only(left: 15, top: 15),
          child: Stack(
            children: [
              buildImage(),
              Positioned(
                bottom: 0,
                right: 4,
                child: buildLoadButton(Colors.black),
              ),
            ]
          ),
    );
  }

  Widget buildImage(){
    final image = Image.asset(imagePath);
    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image.image,
          fit: BoxFit.cover,
          width: 150,
          height: 150,
          child: InkWell(onTap: onClicked,),
        ),
      ),
    );
  }

  Widget buildLoadButton(Color color) => buildCircle(
      color: Colors.white,
      all: 3,
      child: buildCircle(
        color: color,
        all: 8,
        child: Icon(
        Icons.file_download,
        color: Colors.white,
        size: 20,
        ),
      ),
  );

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
}) => ClipOval(
    child: Container(
      padding: EdgeInsets.all(all),
      color: color,
      child: child,
    ),
  );
}




