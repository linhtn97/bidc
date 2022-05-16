import 'package:bidcdashboard/api/dto/staff_report_dto.dart';
import 'package:bidcdashboard/api/service/staff_service.dart';
import 'package:get/get.dart';

class StaffReportController extends GetxController {
  StaffService staffService = StaffService();

  List<List<String>> staffReports = [
    [""]
  ].obs;

  fetchStaffReport(
      String? fcode,
      String? ffullName,
      String? fpreDateOfBirth,
      String? fnextDateOfBirth,
      String? fpreJoinDate,
      String? fnextJoinDate,
      int? fstatus) async {
    staffReports.clear();
    List<StaffReportDTO> futureGetStaffReport =
        await staffService.searchByFilter(
            fcode, //?? code.value
            ffullName, //?? fullName.value
            fpreDateOfBirth, //?? preDateOfBirth.value
            fnextDateOfBirth, //?? nextDateOfBirth.value
            fpreJoinDate, //?? preJoinTime.value
            fnextJoinDate, //?? nextJoinTime.value
            fstatus ?? 1); //?? status.value
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
    // update(['staffReportId'], true);
  }

  reloadStaffReport() {
    // update(['staffReportId'], true);
  }

  reloadSearchStaffReport() {
    // update(['searchStaffReportId'], true);
  }
}
