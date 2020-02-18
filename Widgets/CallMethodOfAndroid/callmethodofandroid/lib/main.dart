
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(CallMethodOfAndroid());

class CallMethodOfAndroid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Call Method Of Android"),
        ),
        body: CallMethod(),
      ),
    );
  }
}


class CallMethod extends StatelessWidget {
  static const platform = const MethodChannel('samples.flutter.dev/battery');
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(onPressed:() async {
        var value =  await platform.invokeMethod('getSumOfNumber');
        print(value);
      }),
    );
  }
}
