import 'dart:io';
import 'package:dio/dio.dart';

// 网络请求类型
enum Method {
  get,
  post
}


class HttpUnit {
  // 服务器及地址
  static String _baseUrl = "https://api.apiopen.top/";
  
  
  
  // 请求 Option 的配置
  static BaseOptions baseOption() {
    var options = new BaseOptions();
    options.baseUrl = _baseUrl;
    //options.headers = requestHeader();
    options.contentType = Headers.contentTypeHeader;
    options.responseType = ResponseType.json;
    options.connectTimeout = 30000;
    options.receiveTimeout = 3000;
    return  options;
  }

  // 请求 Header 的配置
  static Map<String, dynamic> requestHeader(){
    var header = Map();
    
    return header;
  }

  // 公开调用方法
  factory HttpUnit() => _shareInstance();

  // 网络请求对象
  static Dio _dio;

  // 私有成员变量
  static HttpUnit _instance;

  // 静态、私有访问点
  static HttpUnit _shareInstance () {
    if (_instance == null) {
      _instance = HttpUnit._();
    }
    return _instance;
  }

  // 私有构造函数
  HttpUnit._() {
    _dio = Dio(baseOption());
  } 

  // 公共方法
  Future  request(String path, {Method method, Map<String, dynamic> params, Function success, Function error}) async {
    try {
      var options = new Options();
      options.method = ((method == Method.get || method == null) ? "GET":"POST");
      Response response = await _dio.request(path, queryParameters: params, options: options);
      if (response != null) {
        if(response.statusCode == HttpStatus.ok) {
          success(response.data);
        }
      } else {
        error(ErrorAnalyze(code: 1, errMsg: "sss"));
      }
    } catch(err){
      error(err);
              ErrorAnalyze().errorAnalyze(err);

    }
  }

  
}

// 错误解析
class ErrorAnalyze {
  int code;
  String errMsg;
  ErrorAnalyze({this.code, this.errMsg});
  ErrorAnalyze errorAnalyze(DioError error) {
    print(error.message);
    switch (error) {
      case :
        
        break;
      default:
    }
    return ErrorAnalyze(code: 1, errMsg: "sss");
  }
}
