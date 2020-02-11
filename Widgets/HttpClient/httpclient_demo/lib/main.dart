import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
void main() {
  return runApp(HttpClientApp());
}

class HttpClientApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "HttpClient"
          ),
        ),
        body: HttpClientPost(),
      ),
    );
  }
}


/// HttpClient 的 Get 请求
class CityApp extends StatefulWidget {
  _CityApp createState() => _CityApp();
}

class _CityApp extends State {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(child: Text(
        "发起城市请求"
      ),
      onPressed: () async {
        try {
          // 创建 HttpClient
          HttpClient client = HttpClient();
          // 设置请求完成后，与服务器的链接延长时间
          client.idleTimeout = Duration(seconds: 10);
          // 设置与服务器链接超时时间
          client.connectionTimeout = Duration(seconds:30);
          // 打开 HttpClientRequest
          HttpClientRequest clientRequest = await client.getUrl(
            Uri.parse("http://www.mxnzp.com/api/address/list")
          );
          // 设置 User-Agent
          clientRequest.headers.add("user-agent", "Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1");
          // 等待服务器
          HttpClientResponse response = await clientRequest.close();
          // 读取响应内容
          var data = response.transform(utf8.decoder).join();
          data.then((value){
            print(value);
          });
          // 关闭 client
          client.close();
        } catch (err){
          print("请求失败:$err");
        } finally {
          print("--请求结束--");
        }
      })
    );
  }
}


/// HttpClinet 的 Post 请求
class HttpClinetPost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        child: Text("HttpClient-Post-笑话段子请求"),
        onPressed: () async {
          HttpClient client = new HttpClient();
          // 超时时间
          client.connectionTimeout = Duration(seconds: 30);
          // 创建请求
          HttpClientRequest httpClientRequest =  await client.postUrl(
            Uri(scheme: "https", host: "api.apiopen.top", path: "/getSongPoetry", queryParameters: {
              "page":"1"
            })
          );
          // 等待服务器响应
          HttpClientResponse response = await httpClientRequest.close();
          // 获取响应结果
          var data = response.transform(utf8.decoder).join();
          data.then((value){
            print(value);
          });
          // 关闭请求
          client.close();
      }),
    );
  }
}


/// HttpClient 的 Get 请求
class HCGet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(
        "HttpClient GET 请求"
      ),
      onPressed: () async {
        HttpClient client = HttpClient();
        // 注意:host 不能带 http 或者 https
        client.get("www.mxnzp.com", 80, "/api/address/list").then((HttpClientRequest request){
          // 设置请求头
          request.headers.add("user-agent", "Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1");
          return request.close();
        }).then((HttpClientResponse response){
          // 判断是否请求成功
          if (response.statusCode == 200) {
            // 设置解码格式，以 JSON 输出 
            response.transform(utf8.decoder).join().then((value){
              print(value);
            });
          } else {
            print("请求失败");
          }
        });
      });
  }
}

/// HttpClient 的 GetUrl 请求
class HttpClientGetUrl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        child: Text(
          "HttpClient-GetUrl 请求"
        ),
        onPressed: () async {
          try {
            var url = "http://www.mxnzp.com/api/address/list";
            HttpClient client = HttpClient();
            client.connectionTimeout = Duration(seconds:30);
            HttpClientRequest request =  await client.getUrl(
              Uri.parse(url)
            );
            HttpClientResponse response = await request.close();
            if (response.statusCode == 200) {
              var data = response.transform(utf8.decoder).join();
              data.then((value){
                print(value);
              });
            } else {
              print("请求失败");
            }
          } catch (err) {
            print("请求失败:$err");
          } finally {
            print("请求发起");
          }
        }
      ),
    );
  }
}


/// HttpClient 的 Post 请求
class HttpClientPost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        child: Text(
          "HttpClient Post 请求"
        ),
        onPressed: () async {
          HttpClient client = HttpClient();
          // client.connectionTimeout = Duration(seconds: 30);
          // client.idleTimeout = Duration(seconds: 5);
          client.post("api.apiopen.top", 443, "/getSongPoetry").then((HttpClientRequest request){
            // 设置内容格式
            // request.headers.add("Content-Type", "application/json");
            //request.write('"page":"1"');
            // 等待连接服务器
            return request.close();
          }).then((HttpClientResponse response){
            print(response.statusCode);
            if (response.statusCode == 200) {
              response.transform(utf8.decoder).join().then((value){
                print(value);
              });
            } else {
              print("请求失败");
            }
          });
        }),
    );
  }
}


/// HttpClient 的  PostUrl 请求
class HttpClientPostUrl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        child: Text(
          "HttpClient PostUrl 请求"
        ),
        onPressed: () async {
          HttpClient client = new HttpClient();
          client.idleTimeout = Duration(seconds: 5);
          client.connectionTimeout = Duration(seconds: 30);
          HttpClientRequest request = await client.postUrl(
            Uri(scheme: "https", host: "api.apiopen.top", path: "/getSongPoetry",queryParameters: {
              "page":"1"
            })
          );
          HttpClientResponse response = await request.close();
          if (response.statusCode == 200) {
            response.transform(utf8.decoder).join().then((value){
              var data = jsonDecode(value);
              print(data["result"]);
            });
          } else {
            print("请求失败");
          }
          client.close();
        }
      ),
    );
  }
}