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
    return getDiyIconFont();
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

// 本地快捷加载图像
Widget getFaseAssetImage(){
  return Center(
    child: Image.asset(
      "images/img.jpg",
      width: 200,
      height: 120,
    ),
  );
}

// 网络快捷
Widget getNetworkImage(){
  return Center(
    child: Image.network(
      "http://img.pconline.com.cn/images/upload/upc/tx/wallpaper/1206/07/c0/11909864_1339034191111.jpg",
      width: 200,
      height: 120,
    ),
  );
}

// 图片的填充模式
Widget getFitImage(){
  return Center(
    child: Column(
      children: <Widget>[
        Image.asset(
          "images/img.jpg",
          width: 100,
          height: 100,
          fit: BoxFit.fill,
          // 会拉伸填充满显示空间，图片本身长宽比会发生变化，图片会变形
        ),
        SizedBox(
          height: 20,
        ),
        Image.asset(
          "images/img.jpg",
          width: 100,
          height: 100,
          fit: BoxFit.cover,
          // 会按图片的长宽比放大后居中填满显示空间，图片不会变形，超出显示空间部分会被剪裁
        ),
        SizedBox(
          height: 20,
        ),
        Image.asset(
          "images/img.jpg",
          width: 100,
          height: 100,
          fit: BoxFit.contain,
          // 这是图片的默认适应规则，图片会在保证图片本身长宽比不变的情况下缩放以适应当前显示空间，图片不会变形。
        ),
        SizedBox(
          height: 20,
        ),
        Image.asset(
          "images/img.jpg",
          width: 100,
          height: 100,
          fit: BoxFit.fitWidth,
          // 图片的宽度会缩放到显示空间的宽度，高度会按比例缩放，然后居中显示，图片不会变形，超出显示空间部分会被剪裁。
        ),
        Image.asset(
          "images/img.jpg",
          width: 100,
          height: 100,
          fit: BoxFit.fitHeight,
          // 图片的高度会缩放到显示空间的高度，宽度会按比例缩放，然后居中显示，图片不会变形，超出显示空间部分会被剪裁。
        ),
        Image.asset(
          "images/img.jpg",
          width: 100,
          height: 100,
          fit:BoxFit.scaleDown
        )
      ],
    ),
  );
}

// 图像的重复
Widget getRepeatImage(){
  return Center(
    child: Column(
      children: <Widget>[
        Image.asset(
          "images/simg.jpeg",
          width: 100,
          height: 100,
          repeat: ImageRepeat.repeat,
        ),
        Image.asset(
          "images/simg.jpeg",
          width: 100,
          height: 100,
          repeat: ImageRepeat.repeatX,
        ),
        Image.asset(
          "images/simg.jpeg",
          height: 100,
          width: 100,
          repeat: ImageRepeat.repeatY,
        ),
        Image.asset(
          "images/simg.jpeg",
          width: 100,
          height: 100,
          repeat: ImageRepeat.noRepeat,
        )
      ],
    ),
  );
}


// iconFont 的使用
Widget getIconFont(){
  String icons = "";
  icons += "\uE914";
  icons += "\uE000";
  return Center(
    child: Text(
      icons,
      style: TextStyle(
        fontFamily: "MaterialIcons",
        fontSize: 20,
        color: Colors.red
      ),
    ),
  );
}


// Icon 的使用
Widget getIconUse(){
  return Center(
    child: Column(
      children: <Widget>[
        Icon(
          Icons.book,
          color: Colors.red,
        ),
        Icon(
          Icons.edit,
          color: Colors.green,
        ),
      ],
    ),
  );
}

// 自定义字体
class ZSJIcons {
  static const IconData book = const IconData(
    0xe646,
    fontFamily: "iconfont",
    matchTextDirection: true
  );

  static const IconData address = const IconData(
    0x638,
    fontFamily: "iconfont",
    matchTextDirection: true
  );
}

Widget getDiyIconFont(){
  return Center(
    child: Column(
      children: <Widget>[
        Icon(
          ZSJIcons.book,
          color: Colors.red,
        ),
        Icon(
          ZSJIcons.address,
          color: Colors.green,
        )
      ],
    ),
  );
}