import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

void main(List<String> args) {
  return runApp(HttpDioApp());
}

class HttpDioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Http Dio 网络请求"),
        ),
        body: HttpDioUpLoadFile(),
      ),
    );
  }
}

/// HttpDio 的 GET 请求
class HttpDioGet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
          child: Text("HttpDio Get 请求"),
          onPressed: () async {
            var client = Dio();
            var path = "https://api.apiopen.top/singlePoetry";
            await client.get(path).then((Response response) {
              if (response.statusCode == HttpStatus.ok) {
                var data = response.data;
                print(data["result"]);
              } else {
                print("请求失败");
              }
            }).catchError((onErr) {
              print("请求异常:$onErr");
            });
          }),
    );
  }
}

/// HttpDio 的 GetUrl 请求
class HttpDioGetUrl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
          child: Text("HttpDio GetUrl 请求"),
          onPressed: () async {
            try {
              var client = Dio();
              var url = Uri.parse("https://api.apiopen.top/singlePoetry");
              print("try 执行");
              client.getUri(url).then((Response response) {
                if (response.statusCode == 200) {
                  print(response.data);
                }
              });
            } catch (err) {
              print("请求异常:$err");
            } finally {
              print("请求被调用");
            }
          }),
    );
  }
}

/// HttpDio 的 Post 请求
class HttpDioPost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
          child: Text("HttpDio Post 请求"),
          onPressed: () async {
            var client = Dio();
            var path = "https://api.apiopen.top/getJoke";
            Map<String, String> queryParameters = new Map();
            queryParameters["page"] = "1";
            queryParameters["count"] = "20";
            queryParameters["type"] = "video";
            client
                .post(path, queryParameters: queryParameters)
                .then((Response response) {
              if (response.statusCode == HttpStatus.ok) {
                print(response.data);
              }
            });
          }),
    );
  }
}

/// HttpDio PostUrl 的请求
class HttpDioPostUrl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
          child: Text("HttpDio Post Url 请求"),
          onPressed: () async {
            var client = Dio();
            Map<String, String> queryParameters = new Map();
            queryParameters["page"] = "1";
            queryParameters["count"] = "20";
            queryParameters["type"] = "video";
            var uri = Uri.parse("https://api.apiopen.top/getJoke");
            client.postUri(uri).then((Response response) {
              if (response.statusCode == HttpStatus.ok) {
                print(response.data);
              }
            }).catchError((err) {
              print("请求异常");
            });
          }),
    );
  }
}

/// HttpDio 的 download 请求
class HttpDioDownload extends StatelessWidget {
  // 获取路径
  Future<String> getDocmentPath(String file) async {
    return (await getApplicationDocumentsDirectory()).path + "/" + file;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
          child: Text("HttpDio downLoad"),
          onPressed: () async {
            var client = Dio();
            var urlPath = "http://img.ipintu.cn/images/baomanwayong_04.jpg";
            var savePath = await getDocmentPath("my.jpg");
            client.download(urlPath, savePath,
                onReceiveProgress: (int count, int total) {
              if (total > 1) {
                var progress = (count / total * 100).toStringAsFixed(0) + '%';
                print(progress);
              }
            }).then((Response response) {
              if (response.statusCode == HttpStatus.ok) {
                print("下载完成");
                var file = File(savePath);
                print(Image.file(file));
              }
            }).catchError((onErr) {
              print("下载异常:$onErr");
            });
          }),
    );
  }
}

/// HttpDio 的配置 options 设置
class HttpDioOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
          child: Text("HttpDio 的配置"),
          onPressed: () async {
            var client = Dio();
            // 请求方法
            client.options.method = "GET";
            // 链接服务器超时时间
            client.options.connectTimeout = 10;
            //接收数据超时时间（毫秒为单位），0 表示没有限制
            client.options.receiveTimeout = 10;
            // 发送数据超时时间（毫秒为单位）， 0 表示没有限制
            client.options.sendTimeout = 100000;
            // 请求头的设置
            Map<String, dynamic> header = new Map();
            // 设置 cookie
            header["cookie"] = "";
            // 设置 authorization,HTTP授权的授权证书
            header["authorization"] = "";
            // 设置 content-type,请求的与实体对应的MIME信息
            header["content-type"] = "application/x-www-form-urlencoded";
            // 设置 content-length
            header["content-length"] = 348;
            // 设置 user-agent
            header["user-agent"] = "";
            // 设置 range, 只请求实体的一部分，指定范围
            header["range"] = 1024;
            // 配置 options 的 header
            client.options.headers = header;
            /**
           * 设置相应类型
           *  json
           *  只有 content-type 为 application/json 时，才将响应数据转换为JSON对象。
           * 
           *  plain
           *  将相应数据转化为一个 UTF8 编码的字符串。
           * 
           *  stream
           *  接收没有任何转换的数据流，对象是 ResponseBody
           * 
           *  bytes
           *  获取原始字节, List<int> 类型
           * */
            client.options.responseType = ResponseType.stream;
            client.options.validateStatus = false as ValidateStatus;
            // 设置请求失败时，是否接收响应数据
            client.options.receiveDataWhenStatusError = true;
            // 设置请求编码格式(默认是 utf8)
            client.options.requestEncoder = [utf8] as RequestEncoder;
            // 设置请求响应数据编码
            client.options.responseDecoder = "utf8" as ResponseDecoder;
            // 设置请求重定向的次数
            client.options.followRedirects = true;
            client.options.maxRedirects = 4;
            // 额外添加请求信息 ，会在返回信息里
            client.options.extra = {"data": "2020/2/14", "count": 5};
          }),
    );
  }
}

/// HttpDio 单个和多个文件上传
class HttpDioUpLoadFile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        child: Text(
          "HttpDio 的单个文件上传"
        ),
        onPressed: () async {
          var client = Dio();
          client.options.baseUrl = "https://zsysinterface.peogoo.com";
          client.options.headers["token"] = "MJsgafyuauagyf";
          var uploadPath = "/file/uploadFile";
          FormData formData = new FormData.fromMap({
            // 单个文件
            "file": await MultipartFile.fromFile("/Users/phbj/Desktop/Flutter_Codes/Widgets/Http_dio/http_dio_demo/lib/testx.jpg",filename: "testx.jpg"),
            // 多个文件
            "files":[
              await MultipartFile.fromFile("/Users/phbj/Desktop/Flutter_Codes/Widgets/Http_dio/http_dio_demo/lib/testx.jpg",filename: "testx.jpg"),
              await MultipartFile.fromFile("/Users/phbj/Desktop/Flutter_Codes/Widgets/Http_dio/http_dio_demo/lib/testx.jpg",filename: "testx.jpg")
            ]
          });
          client.post(uploadPath, data: formData).then((Response response){
            if (response.statusCode == HttpStatus.ok) {
              print(response.data);
            } else {
              print("请求错误");
            }
          }).catchError((onErr){
            print("请求异常:$onErr");
          });
        }),
    );
  }
}

