import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:imageloader/ImageLoader.dart';

void main() => runApp(ImageLoaderApp());

class ImageLoaderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "加载本地图片"
          ),
        ),
        body: ImageLocal(),
      ),
    );
  }
}

class ImageLocal extends StatefulWidget {
  _ImageLocal createState() => _ImageLocal();
}

class _ImageLocal extends State<ImageLocal> {

  var _image;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          _image == null?Text("图像失败"):_image,
          RaisedButton(
            child: Text(
              "获取图像"
            ),
            onPressed: () {
             setState(() {
               _image = FutureBuilder(
                future: ImageLoader.imageNamed("images/testx.jpg"),
                builder: (context, snapshot) {
                  return Image.memory(snapshot.data);
                }
               );
             });
            }
          )
        ],
      ),
    );
  }
}