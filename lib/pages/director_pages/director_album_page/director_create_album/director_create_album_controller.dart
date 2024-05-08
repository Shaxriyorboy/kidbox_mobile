import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kidbox_mobile/services/utils.dart';

class DirectorCreateAlbumController extends GetxController {
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
                        onTap: () async {
                          Get.back();
                          Utils.openPicker(ImageSource.camera).then((image) {
                            if (image != null) imageFileList.add(image);
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
                        onTap: () async {
                          Get.back();
                          Utils.getPickedImages().then((value) {
                            if (value != null) imageFileList.addAll(value);
                            update();
                          });
                        },
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/images/gallery.png",
                              height: 80.h,
                              width: 80.w,
                            ),
                            Text(
                              "Gallery",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
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

  /// #ShowBottomSheet
  Future showBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) =>
          GetBuilder<DirectorCreateAlbumController>(builder: (context) {
        return DraggableScrollableSheet(
            initialChildSize: 0.75,
            minChildSize: 0.3,
            maxChildSize: 0.75,
            builder: (context, controller) {
              return Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(15.r))),
                child: Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: IconButton(
                        onPressed: () => Get.back(),
                        icon: const Icon(CupertinoIcons.xmark),
                      ),
                      trailing: IconButton(
                        onPressed: updateChecking,
                        icon: const Icon(
                          Icons.done_all_outlined,
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          controller: controller,
                          itemCount: checkList.length,
                          itemBuilder: (context, index) {
                            return CheckboxListTile(
                              checkboxShape: CircleBorder(),
                              value: checkList[index],
                              onChanged: (bool? value) {
                                checkList[index] = value!;
                                update();
                              },
                              title: Text(
                                "Saydullayev E.V",
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              secondary: CircleAvatar(
                                radius: 28.r,
                                foregroundImage:
                                    AssetImage("assets/images/image.png"),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              );
            });
      }),
    );
  }

  void updateChecking() async {
    for (int i = 0; i < checkList.length; i++) {
      checkList[i] = checkAll;
      update();
    }
    checkAll = !checkAll;
  }

  void removeElement(int index) {
    imageFileList.removeAt(index);
    update();
  }
}
