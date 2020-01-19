import 'dart:math';
import 'dart:typed_data';
import 'dart:ui';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:canvas_demo/clock.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

main(){
  debugPaintSizeEnabled = true;
  return runApp(CanvasApp());
}

class CanvasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Canvas"),
        ),
        body: DrawClock(),
      ),
      color: Colors.red,
    );
  }
}

class MainScreen extends StatelessWidget {
    // 获取图像
  Future <ui.Image> loadImageByUint8List(Uint8List list) async {
    ui.Codec codec =  await ui.instantiateImageCodec(list,targetWidth: 200,targetHeight: 300);
    ui.FrameInfo frameInfo = await codec.getNextFrame();
    return frameInfo.image;
  }

  // 读取图像文件
  Future <ui.Image> loadImageByFile(String path) async {
    print("xxxxxx");
    var list = await File(path).readAsBytes();
    print(list);
    return loadImageByUint8List(list);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: FutureBuilder<ui.Image>(
          future: loadImageByFile("/Users/phbj/Desktop/Flutter_Codes/Widgets/Canvas/canvas_demo/images/ss.jpg"),
          builder: (context, snapshot) => CustomPaint(
            size: Size(200, 300),
            painter: DrawImageRect(snapshot.data),
          )
        ),
      ),
    );
  }
}

/// 图像裁剪
class DrawImageRect extends CustomPainter {
  final ui.Image image;
  DrawImageRect(this.image);
  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    canvas.drawImageRect(image, Rect.fromLTWH(0, 0, 100, 100), Rect.fromLTWH(0, 0, 200, 300), Paint()..color = Colors.red);
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}



/// 绘制九宫格
class DrawNineCell extends CustomPainter {
  final ui.Image image;
  DrawNineCell(this.image);
  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    var paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke;
    canvas.drawImageNine(image, Rect.fromCenter(center: Offset(100,100),width: 100,height: 100), Rect.fromLTWH(10, 40, 200, 300), paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

/// 绘制图像
class DrawImage extends CustomPainter {
  final ui.Image image;
  DrawImage(this.image);
  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    var paint = Paint()
      ..color = Colors.red;
    if(image != null) {
      canvas.drawImage(image, Offset(0, 0), paint);
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}


/// 颜色绘制
class DrawColor extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    canvas.drawColor(Colors.red, BlendMode.src);
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

/// 绘制点
class DrawPoint  extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    // 存储场景
    canvas.save();
    // 设置画笔
    var paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 6
      ..style = PaintingStyle.fill;
    // 绘点
    var otherPoint = Offset(100, 30);
    canvas.drawPoints(ui.PointMode.points, [Offset.zero, otherPoint], paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

/// 绘制线
class DrawLine extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    var paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 6
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.square;
    // 创建点
    var point1 = Offset(10, 10);
    var point2 = Offset(100, 100);
    canvas.drawLine(point1, point2, paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

/// 绘制矩形
class DrawRect extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    var paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 6
      ..style = PaintingStyle.fill;
    // 创建矩形大小
    var rect = new Rect.fromLTWH(20, 20, 60, 60);
    canvas.drawRect(rect, paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

/// 绘制圆角矩形
class DrawRRect  extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    var paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 6
      ..style = PaintingStyle.fill;
    // 创建圆角和大小
    var radius = Radius.circular(15);
    var rect = Rect.fromLTWH(20, 20, 100, 100);
    var rrect = new RRect.fromRectAndRadius(rect, radius);
    canvas.drawRRect(rrect, paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}


/// 绘制画笔
class DrawPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    var paint = Paint()
      ..color = Colors.purple
      ..strokeWidth = 6
      ..style = PaintingStyle.stroke;
    
    canvas.drawPaint(paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

/// 画圆或环
class DrawCir extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    var paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;
    var c = Offset(100, 100);
    canvas.drawCircle(c, 80, paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

/// 绘制椭圆
class DrawOval extends CustomPainter { 
  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    var paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 5
      ..style = PaintingStyle.fill;
    var rect = new Rect.fromLTRB(20, 20, 180, 380);
    canvas.drawOval(rect, paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

/// 绘制环形圆角矩形
class DrawDRRect extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    var paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 3
      ..style = PaintingStyle.fill;
    var radius = Radius.circular(15);
    var outer = new RRect.fromLTRBR(20 , 20, 180, 180, radius);
    var inner = new RRect.fromLTRBR(40, 40, 160, 160, radius);
    canvas.drawDRRect(outer, inner, paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

/// 绘制三角形
class DrawVertice extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    var paint = Paint()
      ..color = Colors.green
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;
    var point1 = Offset(100, 100);
    var point2 = Offset(20, 20);
    var point3 = Offset(60, 20);
    var point4 = Offset(120, 50);
    var point5 = Offset(120, 180);

    // 绘制三角
    var vertices = new ui.Vertices(VertexMode.triangleFan, [point1, point2, point3, point4,point5]);
    canvas.drawVertices(vertices, BlendMode.colorBurn, paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

/// 绘制阴影
class DrawShadow extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    // 绘制 path
    var path = Path()
      ..addRect(new Rect.fromLTRB(0, 0, 200, 200));
    canvas.drawShadow(path, Colors.red, 5, true);
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

/// 绘制路径
class DrawPath extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    // 绘制背景色
    canvas.drawColor(Colors.white12, BlendMode.src);
    // 设置画笔
    var paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 6
      ..style = PaintingStyle.stroke;
    // 绘制轮廓
    canvas.save();
    var path = Path()
      ..addArc(Rect.fromCircle(center:Offset(100,100),radius:100), 0, 2 *pi)
      ..close();
    canvas.drawPath(path, paint);
    canvas.restore();
    // 绘制白色区域
    canvas.save();
    paint.color = Colors.white;
    paint.style = PaintingStyle.fill;
    var rect = Rect.fromCircle(center: Offset(100,100),radius: 100);
    var pathw = Path()
      ..addArc(rect, 0.5 *pi, pi)
      ..addArc(Rect.fromCircle(center:Offset(100,50),radius:50), - 0.5*pi, pi)
      ..addArc(Rect.fromCircle(center:Offset(100,150),radius:50), - 0.5*pi, - pi)
      ..close();
    canvas.drawPath(pathw, paint);
    canvas.restore();
    // 绘制白色区域黑色
    canvas.save();
    paint.color = Colors.black;
    var pathwb = Path()
      ..addArc(Rect.fromCircle(center:Offset(100,50), radius: 20), 0, 2 *pi)
      ..close();
    canvas.drawPath(pathwb, paint);
    canvas.restore();
    // 绘制黑色区域的白色
    canvas.save();
    paint.color = Colors.white;
    var pathbw = Path()
      ..addArc(Rect.fromCircle(center:Offset(100,150), radius: 20), 0, 2 *pi)
      ..close();
    canvas.drawPath(pathbw, paint);
    canvas.restore();
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

/// 绘制段落
class DrawParagraph extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    ui.ParagraphBuilder builder = ui.ParagraphBuilder(
      ui.ParagraphStyle(
        textAlign: TextAlign.center,
        fontSize: 20,
        fontWeight: FontWeight.w100,
        ellipsis: "《微笑面对人生》"
      )
    )
      ..pushStyle(ui.TextStyle(color: Colors.red))
      ..addText("微笑着，去唱生。唱唱");
    ui.ParagraphConstraints pConstraint = ui.ParagraphConstraints(width: 160);
    var paragraph = builder.build()..layout(pConstraint);
    canvas.drawParagraph(paragraph, Offset(20, 0));
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}





