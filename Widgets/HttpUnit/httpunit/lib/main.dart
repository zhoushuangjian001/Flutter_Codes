import 'package:flutter/material.dart';
import 'package:httpunit/httpunit.dart';

void main() => runApp(UnitApp());

class UnitApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Http dio 的封装"
          ),
        ),
        body: HUnit(),
      ),
    );
  }
}

class HUnit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        child: Text(
          "Http Dio 请求实例"
        ),
        onPressed: (){
          // var s1 = HttpUnit();
          // var s2 = HttpUnit();
          // print(identical(s1, s2));
  

          HttpUnit().request(
            "getJoke", params:{
              "page":"1",
              "count":"10",
              "type":"video"
            },
            success: (data){
              print(data);
            },
            error: (err){
              print(err);
            }
          );
        }
      ),
    );
  }
}