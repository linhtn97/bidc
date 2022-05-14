import 'package:flutter/material.dart';
import 'package:bidcdashboard/view/components/menu/menu_item.dart';
import 'package:bidcdashboard/view/constant/color.dart';
import 'package:bidcdashboard/view/constant/method.dart';
import 'package:bidcdashboard/view/constant/size.dart';
import 'package:bidcdashboard/view/constant/style.dart';

class LeftSideMenu extends StatelessWidget {
  const LeftSideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 280,
      child: SideMenu(),
    );
  }
}

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: const EdgeInsets.all(SizeConstant.defaultPadding),
      decoration: BoxDecoration(
        color: ColorConstant.backgroundLightColor,
        boxShadow: [StyleDefault.defaultBoxShadow()],
      ),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(SizeConstant.defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("MAIN MENU"),
                    sizedBoxHeightDefault(),
                    for (var item in menuItems["mainMenu"])
                      MMenuItem(
                        icon: item.icon,
                        labelName: item.labelName,
                        subMenuItems: item.subMenuItems,
                        pageRoute: item.pageRoute,
                      ),
                    sizedBoxHeightDefault(),
                    const Text("SUPPORT"),
                    sizedBoxHeightDefault(),
                    for (var item in menuItems["support"])
                      MMenuItem(
                        icon: item.icon,
                        labelName: item.labelName,
                        pageRoute: item.pageRoute,
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
