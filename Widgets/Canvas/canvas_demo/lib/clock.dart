import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DrawClock extends StatefulWidget {
  _DrawClock createState() => _DrawClock();
}

class _DrawClock extends State<DrawClock>{

  Picture clockBg;
  Picture hourHandBg;
  Picture minuteHandBg;
  Picture secondHandBg;

  double hour;
  double minute;
  int second;

  @override
  void initState() {
    super.initState();
    setConfig();
  }

  // 配置
  void setConfig(){
    clockBg = DrawClockBgView(Size(300,300)).drawBgMethod();
    hourHandBg = DrawHourHand(Size(300, 300)).getBgPicture();
    minuteHandBg = DrawMinuteHand(Size(300, 300)).getBgPicture();
    secondHandBg = DrawSecondHand(Size(300, 300)).getBgPicture();
  }

  // 获取当前时间
  void getCurTime(){
    Future.delayed(Duration(seconds: 1),(){
      DateTime curTime = DateTime.now();
      setState(() {
        // 秒
        second = curTime.second;
        int tempMinute = curTime.minute;
        int tempHour = curTime.hour;
        // 分
        minute = tempMinute + second * 1.0/60;
        // 时
        hour = tempHour + minute/60 > 12 ?(tempHour +minute/60 - 12):(tempHour + minute/60);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    getCurTime();
    return Center(
      child: CustomPaint(
        size: Size(300, 300),
        painter: DrawClockEntirety(clockBg, hourHandBg, minuteHandBg, secondHandBg, hour, minute, second),
      ),
    );
  }
}


/// 整体绘制
class DrawClockEntirety extends CustomPainter {

  final Picture clockBgPicture;
  final Picture hourBgPicture;
  final Picture minuteBgPicture;
  final Picture secondBgPicture;

  double hour;
  double minute;
  int second;

  DrawClockEntirety(this.clockBgPicture, this.hourBgPicture, this.minuteBgPicture, this.secondBgPicture, this.hour, this.minute, this.second);

  @override
  void paint(Canvas canvas, Size size) {
    // 绘制钟表背景
    canvas.drawPicture(clockBgPicture);
    // 绘制时针
    pointerRotation(canvas, hourBgPicture, hour, size, 12);
    // 绘制分针
    pointerRotation(canvas, minuteBgPicture, minute, size, 60);
    // 绘制秒针
    pointerRotation(canvas, secondBgPicture,second.toDouble(), size, 60);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  // 指针转动
  void pointerRotation(Canvas canvas, Picture picture, double rota, Size size, int scal) {
    double halfh = size.height * 0.5;
    double halfw = size.width * 0.5;
    canvas.save();
    canvas.translate(halfw, halfh);
    canvas.rotate(2 * pi * rota/scal);
    canvas.translate(-halfw, -halfh);
    canvas.drawPicture(picture);
    canvas.restore();
  }
  
}


/// 钟表底盘绘制 
class DrawClockBgView {
  // 画布大小
  final Size size;
  DrawClockBgView(this.size);

  PictureRecorder _recorder = PictureRecorder();

  // 绘制
  Picture drawBgMethod(){
    // 半宽高
    double halfh = size.height *0.5;
    double halfw = size.width * 0.5;
    // 圆其切割的份数
    int copiesCount = 60;
    // 刻度值
    var markList = ["I","II","III","IIII","V","VI","VII","VIII","IX","X","XI","XII"];
    // 创建画布
    Canvas canvas = Canvas(_recorder);
    // 绘制轮廓线
    var paint = Paint()
      ..color = Colors.black87
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(Offset(size.width * 0.5, size.width * 0.5), size.width * 0.5 - 1, paint);
    canvas.drawCircle(Offset(size.width * 0.5, size.width * 0.5), size.width * 0.5 - 20, paint);
    canvas.save();
    canvas.translate(halfw, halfh);
    for (int i = 1; i <= copiesCount; i ++) {
      canvas.rotate(2 *pi / copiesCount);
      if (i % 5 == 0) {
        paint.strokeWidth = 2;
              // 文字绘制
        TextPainter _textPainter = TextPainter()
          ..textDirection = TextDirection.ltr
          ..text = TextSpan(
            text: markList[(i/5).ceil() - 1],
            style: TextStyle(
              color: Colors.black45,
              fontSize: 20
            )
          )
          ..layout();
        double pointx = - _textPainter.size.width *0.5;
        _textPainter.paint(canvas, Offset(pointx, - halfh + 20));
      } else {
        paint.strokeWidth = 1;
      }
      canvas.drawLine(Offset(0,-halfh + 1), Offset(0, -halfh + 20), paint);
    }
    canvas.restore();
    return _recorder.endRecording();
  }
}

/// 绘制时针
class DrawHourHand {
  final Size size;
  DrawHourHand(this.size);
  PictureRecorder _recorder = PictureRecorder();
  // 绘制
  Picture getBgPicture(){
    double halfh = size.height * 0.5;
    double halfw = size.width *0.5;
    Canvas canvas = Canvas(_recorder);
    var paint = Paint()
      ..color = Colors.black45
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    canvas.translate(halfw, halfh);
    canvas.drawLine(Offset(0,4), Offset(0, -halfh + 85), paint);
    canvas.save();
    paint.color = Colors.black;
    paint.style = PaintingStyle.fill;
    canvas.drawPath(getHeartPicture(canvas,size, 100, 80), paint);
    canvas.restore();
    return _recorder.endRecording();
  }
}
/// 绘制分针
class DrawMinuteHand {
  final Size size;
  DrawMinuteHand(this.size);
  PictureRecorder _recorder = PictureRecorder();
  // 绘制
  Picture getBgPicture(){
    double halfh = size.height * 0.5;
    double halfw = size.width *0.5;
    Canvas canvas = Canvas(_recorder);
    var paint = Paint()
      ..color = Colors.black45
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    canvas.translate(halfw, halfh);
    canvas.drawLine(Offset(0,4), Offset(0, -halfh + 60), paint);
    canvas.save();
    paint.color = Colors.red;
    paint.style = PaintingStyle.fill;
    canvas.drawPath(getHeartPicture(canvas,size, 70, 50), paint);
    return _recorder.endRecording();
  }
}

/// 绘心
Path getHeartPicture(Canvas canvas, Size size, int start, int end) {
  double halfh = size.height * 0.5;
  var control = Offset(-20, -halfh + start + 10);
  var endPoint = Offset(0, -halfh + end);
  Path path = Path();
  Path path1 = Path();
  path1.lineTo(0, -halfh + start);
  path1.quadraticBezierTo(control.dx, control.dy, endPoint.dx, endPoint.dy);
  Path path2 = Path();
  path2.lineTo(0, -halfh + start);
  path2.quadraticBezierTo(-control.dx, control.dy, endPoint.dx, endPoint.dy);
  // add path
  path.addPath(path1, Offset.zero);
  path.addPath(path2, Offset.zero);
  path.close();
  return path;
}

/// 绘制秒针
class DrawSecondHand {
  final Size size;
  DrawSecondHand(this.size);
  PictureRecorder _recorder = PictureRecorder();
  // 绘制
  Picture getBgPicture(){
    double halfh = size.height * 0.5;
    double halfw = size.width *0.5;
    Canvas canvas = Canvas(_recorder);
    var paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 1.5
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    canvas.translate(halfw, halfh);
    canvas.drawLine(Offset(0,10), Offset(0, -halfh + 30), paint);
    canvas.save();
    paint.color = Colors.red;
    paint.strokeWidth = 6;
    canvas.drawLine(Offset(0,13), Offset(0,25), paint);
    canvas.restore();
    canvas.save();
    paint.style = PaintingStyle.fill;
    paint.color = Colors.black;
    canvas.drawCircle(Offset(0,0), 4, paint);
    canvas.restore();
    return _recorder.endRecording();
  }
}
