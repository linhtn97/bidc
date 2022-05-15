import 'package:bidcdashboard/api/dto/staff_report_dto.dart';
import 'package:bidcdashboard/api/service/staff_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StaffReportController extends GetxController {
  StaffService staffService = StaffService();

  //static MenuController instance = Get.find();
  RxString searchCode = "".obs;
  RxString searchFullName = "".obs;
  RxString preDateOfBirth = "".obs;
  RxString nextDateOfBirth = "".obs;
  RxString preJoinTime = "".obs;
  RxString nextJoinTime = "".obs;
  int searchStatus = -1.obs;

  List<List<String>> staffReports = [
    [""]
  ].obs;

  fetchStaffReport() async {
    staffReports.clear();
    List<StaffReportDTO> futureGetStaffReport =
        await staffService.searchByFilter(
            searchCode.value,
            searchFullName.value,
            preDateOfBirth.value,
            nextDateOfBirth.value,
            preJoinTime.value,
            nextJoinTime.value,
            searchStatus);
    for (int i = 0; i < futureGetStaffReport.length; i++) {
      List<String> arrString = [];
      arrString.add(futureGetStaffReport[i].id);
      arrString.add(futureGetStaffReport[i].code);
      arrString.add(futureGetStaffReport[i].firstName);
      arrString.add(futureGetStaffReport[i].lastName);
      arrString.add(futureGetStaffReport[i].dateOfBirth);
      arrString.add(futureGetStaffReport[i].joinDate);
      arrString.add(futureGetStaffReport[i].status);
      arrString.add(futureGetStaffReport[i].branch);
      arrString.add(futureGetStaffReport[i].department);
      arrString.add(futureGetStaffReport[i].position);
      staffReports.add(arrString);
    }
    update(['staffReportId']);
  }

  reloadStaffReport() {
    update(['staffReportId']);
  }
}
