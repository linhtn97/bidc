import 'package:flutter/material.dart';
import 'package:bidcdashboard/view/constant/color.dart';
import 'package:bidcdashboard/view/constant/size.dart';
import 'package:bidcdashboard/view/constant/style.dart';
import 'package:bidcdashboard/view/layout/responsive.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConstant.defaultHeightHeader,
      //padding: const EdgeInsets.all(SizeConstant.defaultPadding),
      decoration: BoxDecoration(
        color: ColorConstant.backgroundLightColor,
        boxShadow: [StyleDefault.defaultBoxShadow()],
      ),
      child: Row(
        children: [
          Responsive.isDesktop(context)
              ? const SizedBox()
              : const MenuDrawerToggle(),
          Row(
            children: const [
              // SizedBox(width: SizeConstant.defaultPadding),
              // Icon(Icons.dashboard_outlined),
              SizedBox(width: SizeConstant.defaultPadding),
              Text(
                "BIDC",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(width: SizeConstant.defaultPadding),
            ],
          )
        ],
      ),
    );
  }
}

class MenuDrawerToggle extends StatelessWidget {
  const MenuDrawerToggle({
    Key? key,
    // required this.menuController,
  }) : super(key: key);

  // final MenuController menuController;

  @override
  Widget build(BuildContext context) {
    const sizeHeight = SizeConstant.defaultHeightHeader;
    return SizedBox(
      height: sizeHeight,
      width: sizeHeight,
      child: TextButton(
          child:
              //const Icon(Icons.close, color: backColor, size: 27)
              const Icon(Icons.menu, color: Colors.black, size: 36),
          onPressed: () => Scaffold.of(context).openDrawer()),
    );
  }
}
