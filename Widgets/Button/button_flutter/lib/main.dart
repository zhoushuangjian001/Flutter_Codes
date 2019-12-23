import 'package:flutter/material.dart';
main() => runApp(ButtonApp());

class ButtonApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Button"
          ),
        ),
        body: MianScreen(),
      ),
    );
  }
}

class MianScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return getAllIconButton();
  }
}


// RaisedButton
Widget getRaisedButton(){
  return Center(
    child: RaisedButton(
      child: Text(
        "RaisedButton 按钮",
      ),
      color: Colors.red,
      textColor: Colors.purple,
      onPressed: (){
        print("RaisedButton 被点击了");
      },
      splashColor: Colors.green,
      hoverColor: Colors.yellow,
      disabledColor: Colors.black,
      focusColor: Colors.pink,
      autofocus: true,
    ),
  );
}


// FlatButton
Widget getFlatButton (){
  return Center(
    child: FlatButton(
      child: Text(
        "FlatBUtton 按钮"
      ),
      color: Colors.red,
      textColor: Colors.green,
      onPressed: (){
        print("FlatButton 被点击了");
      },
    ),
  );
}

// OutlineButton
Widget getOutlineButton (){
  return Center(
    child: OutlineButton(
      child: Text(
        "OutlineButton 按钮"
      ),
      color: Colors.red,
      textColor: Colors.purple,
      onPressed: (){
        print("OutlineButton 被点击");
      },
    ),
  );
}

// IconButton

Widget getIconButton (){
  return Center(
    child: IconButton(
      icon: Icon(Icons.book),
      color: Colors.red,
      tooltip: "图书",
      onPressed: (){
        print("IconButton 被点击了");
      },
    ),
  );
}


// All icon button
Widget getAllIconButton (){
  return Center(
    child: Column(
      children: <Widget>[
        RaisedButton.icon(
          icon: Icon(Icons.bookmark),
          color: Colors.red,
          label: Text("RaisedButton 带图标和文字的按钮"),
          textColor: Colors.yellow,
          onPressed: (){
            print("RaisedButton 图标和文字");
          },
        ),
        FlatButton.icon(
          icon: Icon(Icons.border_all),
          color: Colors.red,
          textColor: Colors.yellow,
          label: Text("FlatButton 带图片和文字的按钮"),
          onPressed: (){
            print(" FlatButton 图标和文字");
          },
        ),
        OutlineButton.icon(
          icon: Icon(Icons.border_left),
          color: Colors.red,
          textColor: Colors.green,
          label: Text("OutlineButton 带图片和文字的按钮"),
          onPressed: (){
            print("OutlineButton 图片和文字");
          },
        )
      ],
    ),
  );
}


// Diy button
Widget getDiyButton(){
  return Center(
    child: FlatButton(
      onPressed: (){
        print("FlatButton 的自定义");
      },
      child: Text("FlatButton 自定义"),
      color: Colors.blue,
      splashColor: Colors.yellow,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0)
      ),
    ),
  );
}
