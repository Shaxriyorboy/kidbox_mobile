import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kidbox_mobile/services/utils.dart';

class ParentAddReportController extends GetxController{
  final titleController = TextEditingController();
  String title = "A holiday event dedicated to the language holiday";
  List<XFile> imageFileList = [];
  List<bool> checkList = List.generate(7, (index) => false);
  bool checkAll = true;

  /// #PickerBottomSheet
  Future pickerBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15.r))),
        context: context,
        builder: (context) => Wrap(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 55.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: [
                  GestureDetector(
                    onTap: () async{
                      Get.back();
                      Utils.openPicker(ImageSource.camera).then((image){
                        if(image!=null) imageFileList.add(image);
                        update();
                      });
                    },
                    child: Column(
                      children: [
                        Image.asset("assets/images/camera.png", height: 80.h, width: 80.w,),
                        Text("Camera", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500,),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () async{
                      Get.back();
                      Utils.getPickedImages().then((value){
                        if(value!=null){
                          imageFileList.addAll(value);
                          update();
                        }
                      });
                    },
                    child: Column(
                      children: [
                        Image.asset("assets/images/gallery.png", height: 80.h, width: 80.w,),
                        Text("Gallery", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500,),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  void deleteImage(index){
    List<XFile> list = imageFileList;
    list.remove(list[index]);
    imageFileList = list;
    update();
    print(list);
  }
}