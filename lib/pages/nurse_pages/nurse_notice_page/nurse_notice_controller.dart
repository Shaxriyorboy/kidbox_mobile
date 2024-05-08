import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

class NurseNoticeController extends GetxController {
  double percent = 0;

  void startDownLoad() async {
    percent = 0;
    update();
    String imgUrl = "http://static.demilked.com/wp-content/uploads/2014/09/mushroom-nature-macro-photography-vyacheslav-mishchenko-2.jpg";
    try {
      Directory directory = await getTemporaryDirectory();
      String path = "${directory.path}/${DateTime.now()}.jpg";
      // String path = '/storage/emulated/0/Download/${DateTime.now()}.jpg';
      update();
      await Dio().download(imgUrl, path,
          onReceiveProgress: (rec, total) {
            percent = (rec / total) * 100;
            update();
          });
      GallerySaver.saveImage(path, toDcim: true);
    } catch (e) {
      debugPrint("$e");
    }
  }


 Future decodeImage(List list) async {
    List decoding = [];
    int height = 0;
    int width = 0;

    for (File image in list) {
      var decodeImage = await decodeImageFromList(image.readAsBytesSync());
      height = decodeImage.height;
      width = decodeImage.width;
      //decoding.add(value);
      update();
    }
    //var decodeImages = await decodeImage(list);

  }
}