import 'package:flutter/material.dart';

void main() => runApp(SimpleInterest());

class SimpleInterest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return null;
  }
}


/// 单利
class Persion {
  // 公共访问方法
  factory Persion() => _shareManager();
  // 静态私有成员，没有初始化
  static Persion _instance;

  // 私有构造函数
  Persion._() {
    print("ss");
  }


  static Persion _shareManager() {
    if (_instance == null) {
      _instance = Persion._();
    }
    return _instance;
  }

}