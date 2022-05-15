import 'package:bidcdashboard/view/components/menu/menu_controller.dart';
import 'package:bidcdashboard/view/pages/page_router.dart';
import 'package:flutter/material.dart';
import 'package:bidcdashboard/view/components/header/header.dart';
import 'package:bidcdashboard/view/components/menu/menu_drawer.dart';
import 'package:bidcdashboard/view/components/menu/side_menu.dart';
import 'package:bidcdashboard/view/constant/size.dart';
import 'package:bidcdashboard/view/layout/main_layout.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 241, 243, 243),
        drawer: const MenuDrawer(),
        body: Stack(
          children: const [
            MainLayout(
              headerFloat: Header(),
              leftSide: LeftSideMenu(),
              rightSide: SizedBox(),
              mainSide: MainSide(),
            ),
          ],
        ),
      ),
    );
  }
}

class MainSide extends StatelessWidget {
  const MainSide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController scrollControllerMainSide = ScrollController();
    final MenuController menuController = Get.put(MenuController());

    return SingleChildScrollView(
      controller: scrollControllerMainSide,
      child: Container(
        padding: const EdgeInsets.all(SizeConstant.defaultPadding),
        child: Obx(
            () => PageRouter(pageRoute: menuController.activePageRoute.value)),
      ),
    );
  }
}
