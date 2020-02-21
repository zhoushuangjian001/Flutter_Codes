import 'package:flutter/material.dart';

void main() => runApp(ImageCrop());

class ImageCrop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Image 裁剪"
          ),
        ),
        body: ImageCropApp(),
      )
    );
  }
}


class ImageCropApp extends StatefulWidget {
  _ImageCropApp createState() => _ImageCropApp();
}

class _ImageCropApp extends State<ImageCropApp>  {
  @override
  Widget build(BuildContext context) {
    return null;
  }
}



