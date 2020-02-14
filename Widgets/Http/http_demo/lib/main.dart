import 'dart:async';
import 'dart:convert';
import 'dart:io';

/// 第三方 Http 请求
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';

void main() => runApp(HttpApp());

class HttpApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Http 请求"),
        ),
        body: HttpUpLoadFile(),
      ),
    );
  }
}

/// Http 的 Get 请求
class HttpGet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
          child: Text("Http Get 请求"),
          onPressed: () async {
            var url = "http://t.weather.sojson.com/api/weather/city/101030100";
            var response = await http.get(url, headers: {
              "Content-Type": "application/json; charset=utf-8",
              "Accept": "application/json"
            });
            if (response.statusCode == 200) {
              var json = jsonDecode(response.body);
              print(json);
            } else {
              print("请求失败");
            }
          }),
    );
  }
}

/// Http 的 Post 请求 try ... catch... finally
class HttpPost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
          child: Text("Http Post 请求"),
          onPressed: () async {
            var client = http.Client();
            try {
              var response = await client.post(
                  "https://api.apiopen.top/getSongPoetry",
                  body: {"page": "1", "count": "20"});
              if (response.statusCode == 200) {
                var json = jsonDecode(response.body);
                print(json);
              } else {
                print("请求失败");
              }
            } catch (err) {
              print("请求失败:$err");
            } finally {
              print("Http Post 请求");
              // 关闭请求
              client.close();
            }
          }),
    );
  }
}

/// Http 的 url encoded  写法
class HttpUrlEncoded extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
          child: Text("Http Post then 写法"),
          onPressed: () async {
            var _client = http.Client();
            var url = "https://abc.com:8090/path2";
            // 设置 headers (url 编码)
            Map<String, String> headerMap = new Map();
            headerMap["content-type"] = "application/x-www-form-urlencoded";
            // 设置参数
            Map<String, String> paramMap = new Map();
            paramMap["name"] = "王二小";
            paramMap["password"] = "zs123456";
            // 发起请求
            _client
                .post(url, headers: headerMap, body: paramMap, encoding: utf8)
                .then((http.Response response) {
              if (response.statusCode == 200) {
                print(response.body);
              } else {
                print("请求失败");
              }
            }).catchError((err) {
              print("请求异常");
            });
          }),
    );
  }
}

/// Http Post JSON 请求
class HttpPostJosnClient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
          child: Text("Http Post JOSN 请求"),
          onPressed: () async {
            var _client = http.Client();
            var url = "https://api.apiopen.top/getJoke";
            Map<String, String> headerMap = new Map();
            headerMap["content-type"] = ContentType.json.toString();
            Map<String, String> bodyParams = new Map();
            bodyParams["page"] = "1";
            bodyParams["count"] = "5";
            bodyParams["type"] = "video";
            _client
                .post(url,
                    headers: headerMap,
                    body: jsonEncode(bodyParams),
                    encoding: Utf8Codec())
                .then((http.Response response) {
              if (response.statusCode == HttpStatus.ok) {
                print(response.body);
              } else {
                print("Post json 请求是失败");
              }
            }).catchError((err) {
              print("请求异常:$err");
            });
          }),
    );
  }
}

/// Http 的文件上传
class HttpUpLoadFile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: <Widget>[
        Image.asset("images/testx.jpg"),
        RaisedButton(
          child: Text("Http 的 UpLoadFile 上传"),
          onPressed: () async {
            var url = "https://test-k8s-dzq-api.lkzuqiu.com/file/uploadFile";
            var _client = http.MultipartRequest("POST", Uri.parse(url));
            http.MultipartFile.fromPath("file", "/Users/phbj/Downloads/testx.jpg",filename: "testx.jpg",
                    contentType: MediaType("image", "jpg")).then((http.MultipartFile file) {
              _client.files.add(file);
              _client.fields["description"] = "http file upload";
              _client.send().then((http.StreamedResponse response) {
                if (response.statusCode == HttpStatus.ok) {
                  response.stream.transform(utf8.decoder).join().then((value) {
                    print(value);
                  });
                } else {
                  print("上传失败");
                }
              }).catchError((onErr) {
                print("上传文件异常:$onErr");
            });
          });
        }),
      ],
    ));
  }
}

/// 对应不同格式请求封装
class UserAgentClient extends BaseClient {
  final String userAgent;
  final http.Client _inner;
  UserAgentClient(this.userAgent, this._inner);

  Future<StreamedResponse> send(BaseRequest request) {
    request.headers["user-agent"] = userAgent;
    return _inner.send(request);
  }
}

// 应用
class HttpUserAgentClient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
          child: Text("UserAgentClient 的使用"),
          onPressed: () {
            var client = http.Client();
            var url = "http://t.weather.sojson.com/api/weather/city/101030100";
            var request = http.MultipartRequest("GET", Uri.parse(url));
            UserAgentClient("userAgent", client).send(request).then((value) {
              if (value.statusCode == 200) {
                value.stream.bytesToString().then((str) {
                  print(str);
                });
              } else {
                print("请求失败");
              }
            });
          }),
    );
  }
}
