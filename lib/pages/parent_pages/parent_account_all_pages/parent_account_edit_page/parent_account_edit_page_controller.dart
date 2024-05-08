
import 'package:get/get.dart';

class ParentEditController extends GetxController{

  List<String> childAvatars=List.generate(12, (index) => "assets/images/child_avatar/child$index.png");
  String avatarPicture = '';


  void setAvatar(String role, int index) {
    avatarPicture = "assets/images/child_avatar/child$index.png";
    update();
  }
}