import 'package:flutter/material.dart';

class ListViewApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListViewSeparated();
  }
}

// 默认初始化
class DefaultListView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        shrinkWrap: true,
        itemExtent: 300,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(10),
        children: <Widget>[
          Text("王"),
          Text("者"),
          Text("荣"),
          Text("耀")
        ],
      ),
    );
  }
}


// builder
class  ListViewBuilder  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (BuildContext context, int index){
        return ListTile(
          title: Text(
            "$index"
          ),
        );
      },
    );
  }
}


// 分割
class ListViewSeparated extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget wd1 = Container(height: 40,child: Text("我是一只大鲨鱼"),color: Colors.red);
    Widget wd2 = Container(height: 40,child: Text("我是二只大鲨鱼"),color: Colors.red);

    return ListView.separated(
      itemCount: 20,
      itemBuilder: (BuildContext context, int index){
        return Text(
          "$index"
        );
      },
      separatorBuilder: (BuildContext context, int index){
        return index%2==0?wd1:wd2;
      },
    );
  }
}