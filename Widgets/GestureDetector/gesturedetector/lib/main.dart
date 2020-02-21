import 'package:flutter/material.dart';

void main() {
  runApp(GDetectorApp());
}

class GDetectorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("GestureDetector 手势检测"),
        ),
        body: GestureDetectorApp(),
      ),
    );
  }
}

class GestureDetectorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.red,
        width: 300,
        height: 300,
        child: GestureDetector(
          child: Container(
            width: 100,
            height: 100,
            color: Colors.pink,
            child: Text("GestureDetector 手势检测"),
          ),
          // 单击手势
          onTap: () {
            print("onTap");
          },

          // 双击手势
          onDoubleTap: () {
            print("onDoubleTap");
          },

          // 长按手势
          onLongPress: () {
            print("onLongPress");
          },

          onForcePressEnd: (details){
            print("onForcePressEnd");
          },
        ),
      ),
    );
  }
}
