import 'package:flutter/material.dart';

void main() => runApp(PointerEventApp());

class PointerEventApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(" AbsorbPoiunter 忽略手势"),
        ),
        body: BehaviorTranslucentTest(),
      ),
    );
  }
}

/// 忽略 PointEvent
class AbsorbPointerTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Listener(
        child: AbsorbPointer(
          child: Listener(
            child: Container(
              color: Colors.red,
              width: 200,
              height: 100,
              child: Text("sssssxxxs"),
            ),
            onPointerDown: (event) {
              print("Container 响应");
            },
          ),
        ),
        onPointerDown: (event) {
          print("AbsorbPointer 响应");
        },
      ),
    );
  }
}

/// 忽略 IgnorePointer
class IgnorePointerTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Listener(
        child: IgnorePointer(
          child: Listener(
            child: Text("IgnorePointer 忽略测试"),
            onPointerDown: (event) {
              print("IgnorePointer  Text 忽略");
            },
          ),
        ),
        onPointerDown: (event) {
          print("IgnorePointer 忽略");
        },
      ),
    );
  }
}

/// Linster 的测试
class LinsterApp extends StatefulWidget {
  _LinsterApp createState() => _LinsterApp();
}

class _LinsterApp extends State<LinsterApp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Container(
          height: 500,
          width: 300,
          color: Colors.purple,
          child: Center(
            child: Listener(
                child: Container(
                  height: 200,
                  width: 200,
                  color: Colors.red,
                  child: Text("Linster 的原始手势指针测试"),
                ),
                onPointerDown: (event) {
                  print("手指按下 down");
                  // 相对手机屏幕原点的点
                  var position = event.position;
                  print(position);

                  // 相对于自身原点的点
                  var localPosition = event.localPosition;
                  print(localPosition);

                  // 判断手指是否按下
                  var isDown = event.down;
                  print(isDown);

                  // 手指按压的面积
                  var size = event.size;
                  print(size);
                },
                onPointerMove: (event) {
                  print("手指移动 move");
                  var tilt = event.tilt;
                  print(tilt);

                  var orientation = event.orientation;
                  print(orientation);
                },
                onPointerUp: (event) {
                  print("手指抬起  up");
                }),
          ),
        ),
      ),
    );
  }
}

class BehaviorTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Listener(
        child: ConstrainedBox(
          constraints: BoxConstraints.tight(Size(200, 100)),
          child: Center(child: Text("BehaviorTest 手势相应的测试")),
        ),
        behavior: HitTestBehavior.opaque,
        onPointerDown: (event) {
          print("BehaviorTest 按下");
        },
      ),
    );
  }
}

class BehaviorTranslucentTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Listener(
            child: ConstrainedBox(
              constraints: BoxConstraints.tight(Size(200, 200)),
              child: DecoratedBox(decoration: BoxDecoration(color: Colors.red)),
            ),
            onPointerDown: (event) {
              print("Listener1 手势按下");
            },
          ),
          Listener(
            child: ConstrainedBox(
              constraints: BoxConstraints.tight(Size(200, 100)),
              child: Center(
                child: Text("手势"),
              ),
            ),
            behavior: HitTestBehavior.translucent,
            onPointerDown: (evevt) {
              print("Listener2 手势按下");
            },
          )
        ],
      ),
    );
  }
}
