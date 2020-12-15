import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImagePickerPath {
  static String unsplash = 'assets/unsplash.png';
  static String gallery = 'assets/gallery.png';
}

class ImagePickerTitle {
  static String unsplash = 'Unsplash';
  static String gallery = 'Gallery';
}

class ImagePickerCard extends StatelessWidget {
  final String imagePath;
  final String cardTitle;
  final Function onTap;

  ImagePickerCard({this.imagePath, this.cardTitle, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        child: GestureDetector(
          onTap: this.onTap,
          child: Container(
            height: 120.0,
            width: 120.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter),
            ),
            child: Stack(
              children: [
                Container(color: Color.fromRGBO(0, 0, 0, 0.44)),
                Center(
                    child: Text(
                  cardTitle,
                  style: TextStyle(color: Colors.white),
                )),
              ],
            ),
          ),
        ));
  }
}
