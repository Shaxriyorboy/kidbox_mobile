
import 'package:get/get.dart';

class DirectorReportController extends GetxController{
  List<bool> selectItem=List<bool>.generate(0, (index)=>false);

  void selectListItem(index){
  selectItem[index]=!selectItem[index];
  update();
}

}