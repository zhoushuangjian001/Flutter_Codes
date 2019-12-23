import 'package:flutter/material.dart';

main() => runApp(ImageIconApp());

class ImageIconApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Image&Icon"),
        ),
        body: MainScreen(),
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return getImageFromAsset();
  }
}

//从 asset 中加载图片
Widget getImageFromAsset(){
  return Center(
    child: Column(
      children: <Widget>[
        Image(
          image: AssetImage("images/img.jpg"),
          // 设置图片的宽度
          width: 200,
          height: 120,
          // 设置图片背景，设置完后图片不能覆盖
          color: Colors.red,
          // 图片的缩放
          fit: BoxFit.fitWidth ,
          colorBlendMode: BlendMode.colorDodge,
        ),
        Image(
          // 网络加载
          image: NetworkImage("http://img.pconline.com.cn/images/upload/upc/tx/wallpaper/1206/07/c0/11909864_1339034191111.jpg"),
          width: 300,
          height: 120,
          repeat: ImageRepeat.repeatX,
        )
      ],
    ),
  );
}