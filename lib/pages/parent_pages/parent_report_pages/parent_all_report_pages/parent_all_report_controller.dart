
import 'package:get/get.dart';

class ParentReportController extends GetxController{
  List<bool> selectItem=List<bool>.generate(10, (index)=>false);

  void selectListItem(index){
  selectItem[index]=!selectItem[index];
  update();
}

}