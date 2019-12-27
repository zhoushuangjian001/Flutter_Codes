import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Textfield_Form"
          ),
        ),
        body: MainScreen(),
      ),
    );
  }
}

class  MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return selecdText();
  }
}

// Textfield
Widget getTextField(){
  return Center(
    child: Column(
      children: <Widget>[
        TextField(
          style: TextStyle(
            // 设置输入文字颜色
            color: Colors.red,
            // 设置输入文字大小
            fontSize: 20
          ),
          // 设置输入文字的位置
          textAlign: TextAlign.left,
          textAlignVertical: TextAlignVertical(
            // y 的取值范围 (-1 ~ 1 )
            y: 0
          ),
          textDirection: TextDirection.ltr,
          // 是否自动获取焦点
          autofocus: true,
          decoration: InputDecoration(
            labelText: "姓名",
            hintText: "请输入姓名",
            prefixIcon: Icon(Icons.account_balance)
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          child: TextField(
            style: TextStyle(
              color: Colors.red
            ),
            decoration: InputDecoration(
              // labelText: "密码",
              hintText: "请输入密码",
              hintStyle: TextStyle(
                color: Colors.purple,
                fontSize: 20
              ),
              prefixIcon: Icon(Icons.lock)
            ),
          ),
        )
      ],
    ),
  );
}

// 获取 TextField 的输入内容
Widget getTextFieldContent(){
  // 创建控制器
  TextEditingController _teditVc = TextEditingController();
  return Center(
    child: SizedBox(
      height: 40,
      width: 200,
      child: TextField(
        controller: _teditVc,
        decoration: InputDecoration(
          hintText: "请输入姓名",
          helperText: "姓名",
          counterText: "我是一只大鲨鱼"
        ),
        onChanged: (text){
          // 通过 controller 来获取数据
          print(_teditVc.text);
        },
      ),
    ),
  );
}

// 监控输入变化
/*
 * 监听文本变化也有两种方式：
 * 1、设置onChange回调
 * 2、通过controller监听
 */
Widget obeserveTextFiledChage(){
  TextEditingController _teditVc = TextEditingController();
  _teditVc.addListener((){
    print( "控制器监控输入:" + _teditVc.text);
  });
  return Center(
    child: Column(
      children: <Widget>[
        TextField(
          decoration: InputDecoration(
            hintText: "请输入手机号",
            prefixIcon: Icon(Icons.phone)
          ),
          // onChanged 监控输入
          onChanged: (text){
            print("输入的内容:" + text);
          },
          // 设置输入键盘
          keyboardType: TextInputType.phone,
        ),
        TextField(
          controller: _teditVc,
          decoration: InputDecoration(
            hintText: "请输入地址",
            icon: Icon(Icons.add),
            isDense: true
          ),
          maxLines: null,
          maxLength: 12,
        )
      ],
    ),
  );
}

// 选择文本
Widget selecdText(){
  TextEditingController _teditVC = TextEditingController();
  // 设置默认选择
  _teditVC.text = "我是一只大鲨鱼";
  _teditVC.selection = TextSelection(
    baseOffset: 2,
    extentOffset: _teditVC.text.length,
    isDirectional: true
  );
  return Center(
    child: TextField(
      controller: _teditVC,
    ),
  );
}