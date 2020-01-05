import 'package:flutter/material.dart';

main() => runApp(PaddingApp());

class PaddingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Padding"),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // 单个方向设置 only
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text("白日依山尽"),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text("白日依山尽"),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Text("白日依山尽"),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text("白日依山尽"),
              )
            ],
          ),
        ),
      ),
    );
  }
}