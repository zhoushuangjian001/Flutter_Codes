import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

main() =>runApp(SwitchCheckBoxApp());

class SwitchCheckBoxApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "SwitchCheckBox"
          ),
        ),
        body: MainScreen(),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  _MainScreenState createState() => _MainScreenState();  
}

class _MainScreenState extends State<MainScreen> {
  bool _switchSelected = true;
  bool _checkboxSelected = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Switch(
          // 状态
          value: _switchSelected,
          // 点击切换
          onChanged: (value){
            // 更新开关状态
            setState(() {
              _switchSelected = value;
            });
          },
          // 开关开启状态下圆饼颜色
          activeColor: Colors.red,
          // 开关开启时的轨道颜色
          activeTrackColor: Colors.green,
          // 开关关闭状态下的轨道颜色
          inactiveTrackColor: Colors.purple,
          // 开关关闭下的圆饼颜色
          inactiveThumbColor: Colors.cyan,
          // 开关开启下圆饼图片
          activeThumbImage: AssetImage(
            "images/xins.png"
          ),
          // 开关关闭下圆饼图片
          inactiveThumbImage: AssetImage(
            "images/xin.png"
          ),
          // 设置点击区域 shrinkWrap(区域大小不确定时) padded（默认， 48px * 48px）
          materialTapTargetSize: MaterialTapTargetSize.padded,
          // 设置拖拽事件开始的位置
          dragStartBehavior: DragStartBehavior.start,
        ),
        SizedBox(
          height: 20,
        ),
        Checkbox(
          // 当前状态
          value: _checkboxSelected,
          // 选中时盒子填充颜色
          activeColor: Colors.red,
          // 选中图标的颜色
          checkColor: Colors.purple,
          // 状态变化
          onChanged: (value){
            setState(() {
              _checkboxSelected = value;
            });
          },
          // 是否开启三态， 选中、未选中、null
          tristate: false,
        )
      ],
    );
  }
}