import 'package:flutter/material.dart';

main()=>runApp(TextApp());

class TextApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Text的介绍"),
        ),
        body: TextFirstRoute(),
      ),
      color: Colors.white,
    );
  }
}

class TextFirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            "Text的样式一",
            textAlign: TextAlign.center,
          ),
          Text(
            "Text的样式二" * 3,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.justify,
          ),
          Text(
            "Text的样式三s" *5,
            textScaleFactor: 2,
            textAlign: TextAlign.end,
          )
        ],
      ),
    );
  }
}