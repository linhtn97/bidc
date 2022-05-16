import 'package:get/get.dart';
import 'package:bidcdashboard/view/components/menu/menu_item.dart';

class MenuController extends GetxController {
  //static MenuController instance = Get.find();

  var activePageRoute = staffReportPageRoute.obs;
  var activeMenuItem = staffManagementPageRoute.obs;
  var activeSubMenuItem = staffReportPageRoute.obs;
  var clickedMenuItem = "".obs;

  var hoverItem = "".toString().obs;

  RxBool menuDrawerActive = false.obs;

  changeActiveItemTo(String itemName) => activeMenuItem.value = itemName;

  isHovering(String itemName) => hoverItem.value = itemName;
}
