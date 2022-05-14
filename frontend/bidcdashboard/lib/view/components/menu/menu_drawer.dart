import 'package:flutter/material.dart';
import 'package:bidcdashboard/view/components/menu/side_menu.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 300,
      child: SideMenu(),
    );
  }
}
