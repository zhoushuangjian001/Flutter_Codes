import 'package:flutter/material.dart';

main() => runApp(ProgressApp());

class ProgressApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "ProgressIndicator"
          ),
        ),
        body: MainScreen(),
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return getDiySizeOfProgressIndicator();
  }
}

// 条形进度指示器
Widget getProgressIndicator (){
  return Center(
    child: LinearProgressIndicator(
      // 进度值 （当进度为 null 时, 进度会按一个随机进度做循环动画）
      value: 0.6,
      // 进度默认轨道颜色
      backgroundColor: Colors.green,
      // 进度当前轨道颜色值，可以动画
      valueColor: AlwaysStoppedAnimation(Colors.pink),
    ),
  );
}

// 环形进度条
Widget getCircularProgressIndicator (){
  return Center(
    child: CircularProgressIndicator(
      // 当前进度值
      value: 0.78,
      // 默认颜色
      backgroundColor: Colors.green,
      // 当前进度的颜色
      valueColor: AlwaysStoppedAnimation(Colors.red),
      // 圆环的宽度，默认为 4
      strokeWidth: 18,
    ),
  );
}

// 自定义大小的进度
// LinearProgressIndicator和CircularProgressIndicator都是取父容器的尺寸作为绘制的边界的
Widget getDiySizeOfProgressIndicator (){
  return Center(
    child: Column(
      children: <Widget>[
        SizedBox(
          height: 10,
          width: 300,
          child: LinearProgressIndicator(
            value: 0.8,
            backgroundColor: Colors.grey,
            valueColor: AlwaysStoppedAnimation(Colors.red),
          ),
        ),
        SizedBox(
          height: 100,
          width: 100,
          child: CircularProgressIndicator(
            value: 0.6,
            backgroundColor: Colors.grey,
            valueColor: AlwaysStoppedAnimation(Colors.red),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 100,
          width: 200,
          child: CircularProgressIndicator(
            value: 0.56,
            backgroundColor: Colors.grey,
            valueColor: AlwaysStoppedAnimation(Colors.red),
          ),
        )
      ],
    ),
  );
}
