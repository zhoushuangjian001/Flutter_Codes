import 'package:flutter/material.dart';

import 'listview.dart';

main(){
  return runApp(SingleScrollApp());
}

class SingleScrollApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "SingleScroll"
          ),
        ),
        body: ListViewApp(),
      ),
    );
  }
}

class SingleScr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String str = "123456789123456789123456789123456789123456789123456789123456789123456789123456789123456789123456789";
    return Scrollbar(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(16),
        child: Container(
          width: 200,
          color: Colors.red,
          child: Column(
            children: str.split("").map((value) => Text(
              value,
            )).toList(),
          ),
        ),
      ),
    );
  }
}