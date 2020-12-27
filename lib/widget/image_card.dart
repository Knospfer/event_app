import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  final String imagePath;

  ImageCard({this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Card(
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        child: Container(
            decoration: BoxDecoration(color: Colors.grey[300]),
            height: 200.0,
            width: double.infinity,
            child: FadeInImage.assetNetwork(
                alignment: Alignment.center,
                fit: BoxFit.cover,
                placeholder: 'assets/unsplash.png',
                image: imagePath)));
  }
}
