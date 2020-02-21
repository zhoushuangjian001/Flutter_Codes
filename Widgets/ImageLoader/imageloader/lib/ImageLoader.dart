import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


/// 获取本地图像
class ImageLoader {
  // 获取 AssetBundle
  static AssetBundle  mainAssetBundle() => (rootBundle != null)? rootBundle:NetworkAssetBundle(Uri.directory(Uri.base.origin));
  
  // 获取图像
  static Future<ui.Image> imageNamed(String url) async {
    // 获取图像的 Stream
    ImageStream stream = AssetImage(url,bundle: mainAssetBundle()).resolve(ImageConfiguration.empty);
    Completer <ui.Image> completer = Completer<ui.Image>();
    ImageStreamListener listener;
    listener = new ImageStreamListener((ImageInfo info, bool syncCall){
      final ui.Image image = info.image;
      completer.complete(image);
      stream.removeListener(listener);
    });
    stream.addListener(listener);
    return completer.future;
  }
}
