///  QuickType 网站提供的 Json 转 Model
///  QuickType 网站:https://app.quicktype.io
///  查找 Ctrl+F
///  查找替换 Ctrl+H
//   整个文件夹中查找 Ctrl+Shift+F

import 'dart:convert';

Game diyFromJson(String str) => Game.fromJson(json.decode(str));

String diyToJson(Game data) => json.encode(data.toJson());

class Game {
    String name;
    String type;
    List<ListElement> list;
    // 便利构造
    Game({this.name, this.type, this.list});
    // 工厂方法
    factory Game.fromJson(Map<String, dynamic> json) => Game(
        name: json["name"],
        type: json["type"],
        list: List<ListElement>.from(json["list"].map((x) => ListElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "type": type,
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
    };
}

class ListElement {
    String name;
    int money;

    ListElement({
        this.name,
        this.money,
    });

    factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        name: json["name"],
        money: json["money"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "money": money,
    };
}
