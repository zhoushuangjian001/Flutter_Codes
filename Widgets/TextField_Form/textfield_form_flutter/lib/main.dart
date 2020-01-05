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
    return getRouteBtn(context);
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

// 键盘
Widget getKeyBoardType(){
  return Center(
    child: TextField(
      decoration: InputDecoration(
        labelText: "请输",
        hintText: "请输入手机号",
      ),
      maxLines: 3,
      // number ： 数字键盘 （0-9和删除键）
      // text 和 datetime：小写字母（a-z 和左下角为数字、空格、done ）
      // multiline:  小写字母（a-z 和左下角为数字、空格、return 换行 。如果 maxLines 为1 ,点击return 为收起键盘，否则为换行）
      // phone:  数字键盘 （0-9和删除键 和 +*#）
      // emailAddress:  小写字母（a-z 和左下角为数字、空格、@、 . 、done ）
      // url:  小写字母（a-z 和左下角为数字、.com、/、 . 、done ）
      keyboardType:TextInputType.emailAddress,
      textInputAction: TextInputAction.send,
    ),
  );
}

// 登录输入框
Widget getLoginTextField(){
  return Center(
    child: Column(
      children: <Widget>[
        TextField(
          autofocus: true,
          decoration: InputDecoration(
            labelText: "用户名",
            hintText: "用户邮箱",
            prefixIcon: Icon(Icons.person)
          ),
        ),
        TextField(
          decoration: InputDecoration(
            labelText: "密码",
            hintText: "请输入密码",
            prefixIcon: Icon(Icons.lock)
          ),
          obscureText: true,
        )
      ],
    ),
  );
}

// 焦点控制
// 默认情况下，焦点由 FocusScope 来管理，它代表焦点控制范围，可以在这个范围内可以通过 FocusScopeNode 在输入框之间移动焦点、设置默认焦点等。

class FocusTestRoute extends StatefulWidget {
  _FocusTestRoute createState() => _FocusTestRoute();
}

class _FocusTestRoute extends State<FocusTestRoute> {
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusScopeNode focusScopeNode;
  @override
  Widget build(BuildContext context) {

  // 监听焦点的变化
  focusNode1.addListener((){
    print(focusNode1.hasFocus);
  });
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          TextField(
            autofocus: true,
            focusNode: focusNode1,
            decoration: InputDecoration(
              labelText: "第一个输入框"
            ),
          ),
          TextField(
            focusNode: focusNode2,
            decoration: InputDecoration(
              labelText: "第二个输入框"
            ),
          ),
          Builder(builder: (ctx){
            return Column(
              children: <Widget>[
                RaisedButton(
                  child: Text("移动焦点"),
                  onPressed: (){
                    // 第一种写法
                    //FocusScope.of(context).requestFocus(focusNode2);

                    // 第二种写法
                    if(null ==focusScopeNode){
                      focusScopeNode = FocusScope.of(context);
                    }
                    focusScopeNode.requestFocus(focusNode2);
                  },
                ),
                RaisedButton(
                  child: Text("隐藏键盘"),
                  onPressed: (){
                    focusNode1.unfocus();
                    focusNode2.unfocus();
                  },
                )
              ],
            );
          })
        ],
      ),
    );
  }
}

// 隐藏下划线，自定义下划线
Widget getHiddenBottonLine(){
  return Center(
    child: Container(
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: "Email",
          hintText: "请输入电子邮件地址",
          prefixIcon: Icon(Icons.email),
          // 隐藏下划线
          border: InputBorder.none
        ),      
      ),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.red,width: 2))
      ),
    )
  );
}


// Form 表单
// 作用： 它可以对输入框分组，然后进行统一操作，比如校验内容，输入框重置以及保存输入内容。

Widget getRouteBtn (BuildContext context){
  return Center(
    child: RaisedButton(
      child: Text("登录"),
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context){
            return FormRoute();
          }
        ));
      },
    ),
  );
}


class FormRoute extends StatefulWidget {
  _FormRoute createState() => _FormRoute();
}

class _FormRoute extends State<FormRoute> {
  TextEditingController _unnameController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  GlobalKey _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Test"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24) ,
        child: Form(
          key: _formKey,
          autovalidate: true,
          child: Column(
            children: <Widget>[
              TextFormField(
                autofocus: true,
                controller: _unnameController,
                decoration: InputDecoration(
                  labelText: "用户名",
                  hintText: "用户名或邮箱",
                  icon: Icon(Icons.person)
                ),
                // 检验
                validator: (value){
                  print("检验");
                  print(value);
                  return value.trim().length > 0 ? null:"用户名不能为空";
                },
              ),
              TextFormField(
                controller: _pwdController,
                decoration: InputDecoration(
                  labelText: "密码",
                  hintText: "您的登录密码",
                  icon: Icon(Icons.lock)
                ),
                // 安全
                obscureText: true,
                // 校验
                validator: (value){
                  return value.trim().length > 5 ? null:"密码不能少于6 位";
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 28.0),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        padding: EdgeInsets.all(15),
                        child: Text("登录"),
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        onPressed: (){
                          // 在这里通过 Form.of(context) 获取 FormState 是不正确的。
                          FormState formState = _formKey.currentContext as FormState;
                          if(formState.validate()){
                            // 验证通过
                            print("验证通过");
                            // 重置
                            formState.reset();
                          }
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}