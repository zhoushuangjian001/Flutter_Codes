import 'package:flutter/gestures.dart';
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
    return  getDefaultTextStyle();
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


// TextSpan (文本分成不同模块，不同功能显示)
Widget getTextSpan(){
  return Center(
    child: Text.rich(
      TextSpan(
        children:[
          TextSpan(
            text: "百度的搜索引擎是:"
          ),
          TextSpan(
            text: "https://www.baidu.com",
            style: TextStyle(
              color: Colors.red
            ),
            recognizer: TapGestureRecognizer()..onTap=(){
              print("地址被点击");
            }
          )
        ]
      )
    )
  );
}
// TextSpan 的多层点击
Widget getPicuterTextSpan(){
  return Center(
    child: Text.rich(
      TextSpan(
        text: "TextSpan 测试",
        semanticsLabel: "中华人民共和国",
        children: [
          TextSpan(
            text: "TextSapn 第二层",
            semanticsLabel: "第二层意思",
            recognizer: TapGestureRecognizer()..onTap = (){
              print("第二层点击");
            }
          )
        ],
        recognizer: TapGestureRecognizer()..onTap = (){
          print("第一层点击");
        }
      ),
    ),
  );
}


// DefaultTextStyle
Widget getDefaultTextStyle(){
  return Center(
    child: DefaultTextStyle(
      // 设置默认样式
      style: TextStyle(
        color: Colors.red,
        fontSize: 20
      ),
      textWidthBasis: TextWidthBasis.longestLine,
      maxLines: 2,
      child: Column(
        children: <Widget>[
          Text(
            "白日依山尽"
          ),
          Text(
            "黄河入海流" * 20
          ),
          Text(
            "欲穷千里目" * 12
          ),
          Text(
            "更上一层楼",
            style: TextStyle(
              inherit: false,
              color: Colors.purple,
              fontSize: 30
            ),
          )
        ],
      ),
    ),
  );
}


// asset font
Widget getAssetFont(){
  return Center(
    child: Text(
      "asset 中字体",
      style: TextStyle(
        fontFamily: "Schyler",
        fontStyle: FontStyle.italic,
        fontSize: 20
      ),
    ),
  );
}