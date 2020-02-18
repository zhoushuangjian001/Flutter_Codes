import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() => runApp(CallCamera());

class CallCamera extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Call Camera"
          ),
        ),
        body: CameraPicker(),
      ),
    );
  }
}

class CameraPicker extends StatefulWidget {
  _CaneraPicker createState() => _CaneraPicker();
}

class _CaneraPicker extends State<CameraPicker> {

  File _imageFile;

  Future getImageForCamera() async {
    // 可以设置图片的最大宽高、图片质量
    var image = await ImagePicker.pickImage(source: ImageSource.camera,maxWidth: 200);
    setState(() {
      _imageFile = image;
    });
  }

  Future getImageForPhoto() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          _imageFile == null? Text("图像获取Demo"):Image.file(_imageFile),
          RaisedButton(
            child: Text(
              "调用相机"
            ),
            onPressed: getImageForPhoto
          )
        ],
      ),
    );
  }
}