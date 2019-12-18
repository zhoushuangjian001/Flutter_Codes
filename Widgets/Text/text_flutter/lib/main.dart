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
    return  getTextDircetion();
  }
}

// TextAlign 的介绍
Widget getTextAlign(){
  return Center(
    child: Column(
      children: <Widget>[
        Text(
          "样式一",
          textAlign: TextAlign.left,
        ),
        Text(
          "样式二",
          textAlign: TextAlign.right,
        ),
        Text(
          "样式三",
          textAlign: TextAlign.center,
        ),
        Text(
          "样式四",
          textAlign: TextAlign.justify,
        ),
        Text(
          "样式五",
          textAlign: TextAlign.start,
        ),
        Text(
          "样式六",
          textAlign: TextAlign.end,
        )
      ],
    ),
  );
}

// TextDirection 的介绍
Widget getTextDircetion(){
  return Center(
    child: Column(
      children: <Widget>[
        Text(
          "abcdefghigk" * 6,
          textDirection: TextDirection.ltr,
        ),
        Text(
          "abcdefghigk" * 6,
          textDirection: TextDirection.rtl,
        ),
        Expanded(
          child: Text(
            "12345678910",
            textDirection: TextDirection.rtl,
          ),
        )
      ],
    ),
  );
}


