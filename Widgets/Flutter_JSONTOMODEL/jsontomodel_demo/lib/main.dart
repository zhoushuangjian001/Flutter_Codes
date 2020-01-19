import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jsontomodel_demo/game.dart';
import 'package:jsontomodel_demo/person.dart';

main(){
  return runApp(JsonToModelApp());
}

class JsonToModelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Json To Model"),
        ),
        body: JsonMain(),
      ),
    );
  }
}

// ignore: must_be_immutable
class JsonMain extends StatelessWidget {
  Person ximing;
  // 获取 Json 文件
  void getLocalJson() async{
    await rootBundle.loadString("images/ximing.json").then((value){
      Map data = json.decode(value);
      print(data);
      ximing = Person.fromJson(data);
      print(ximing.sex);
      var map = ximing.toJson();
      print(map);
    });
  }

  void getGameLocalJson() async {
    await rootBundle.loadString("images/game.json").then((value){
      print(value);
      Game game = diyFromJson(value);
      print(game);
      print(game.list);
      List<ListElement> listArr = game.list;
      var tuple = listArr.map((value){
        print(value.name);
      });
      print(tuple);
      var sjosn = diyToJson(game);
      print(sjosn);
    }).catchError((err){
      print("解析失败");
    });
  }
  
  @override
  Widget build(BuildContext context) {
    getLocalJson();
    getGameLocalJson();
    return Center(
      child: Text("ss"),
    );
  }
}