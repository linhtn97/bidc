import 'package:bidcdashboard/view/components/menu/menu_item.dart';
import 'package:bidcdashboard/view/pages/staff_management/create_new_staff.dart';
import 'package:bidcdashboard/view/pages/staff_management/staff_report.dart';
import 'package:flutter/material.dart';

class PageRouter extends StatelessWidget {
  const PageRouter({
    Key? key,
    required this.pageRoute,
  }) : super(key: key);

  final String pageRoute;

  @override
  Widget build(BuildContext context) {
    // for (var item in menuItems) {
    //   if (pageRoute == item.pageRoute.value) const CurriculumVitae();
    // }
    // return const SizedBox();
    switch (pageRoute) {
      case staffAddPageRoute:
        return const CreateNewStaff();
      case staffReportPageRoute:
        return const StaffReport();
      default:
        return const SizedBox();
    }
  }
}
