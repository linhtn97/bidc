import 'package:bidcdashboard/api/api_response.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:bidcdashboard/api/dto/staff_report_dto.dart';

class StaffService {
  String baseUlr = "http://localhost:8080/api/v1/staff";
  Map<String, String> get headers => {
        "Content-Type": "application/json",
        "Accept": "application/json",
        // "Authorization": "Bearer " + token,
      };

  Future<List<StaffReportDTO>> searchByFilter(
      String? code,
      String? fullName,
      String? preDateOfBirth,
      String? nextDateOfBirth,
      String? preJoinDate,
      String? nextJoinDate,
      int status) async {
    var uri = "$baseUlr/search-by-filter";

    if (code == "".trim()) code = null;
    if (fullName == "".trim()) fullName = null;
    if (preDateOfBirth == "".trim()) preDateOfBirth = null;
    if (nextDateOfBirth == "".trim()) nextDateOfBirth = null;
    if (preJoinDate == "".trim()) preJoinDate = null;
    if (nextJoinDate == "".trim()) nextJoinDate = null;

    var body = jsonEncode(<dynamic, dynamic>{
      "objFil": {
        "code": code,
        "fullName": fullName,
        "preDateOfBirth": preDateOfBirth,
        "nextDateOfBirth": nextDateOfBirth,
        "preJoinDate": preJoinDate,
        "nextJoinDate": nextJoinDate,
        "status": status
      }
    });

    try {
      var response = await http.post(
        Uri.parse(uri),
        headers: headers,
        body: body,
      );

      var jsonResponseBody = jsonDecode(response.body);
      if (response.statusCode == 200) {
        var dataJson = jsonResponseBody["data"];
        final List parsed = dataJson;
        List<StaffReportDTO> temp =
            parsed.map((e) => StaffReportDTO.fromJson(e)).toList();

        return temp;
      } else {
        return Future.error("Error Server: ${jsonResponseBody["status"]}");
      }
      // ignore: non_constant_identifier_names
    } catch (SocketException) {
      return Future.error("Error Fetching Data !");
    }
  }

  deleteOne(String id) async {
    var uri = "$baseUlr/delete-one?id=$id";

    try {
      var response = await http.delete(
        Uri.parse(uri),
        headers: headers,
      );

      var jsonResponseBody = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return true;
      } else {
        return Future.error("Error Server: ${jsonResponseBody["status"]}");
      }
      // ignore: non_constant_identifier_names
    } catch (SocketException) {
      return Future.error("Error Fetching Data !");
    }
  }

  Future<APIResponse> createOne(
      String code,
      String firstName,
      String lastName,
      // final String fullName;
      dynamic dateOfBirth,
      int branchId,
      int departmentId,
      int positionId,
      dynamic joinDate,
      int status) async {
    var uri = "$baseUlr/create-one";

    var body = jsonEncode(<dynamic, dynamic>{
      "objFil": {
        "code": code,
        "firstName": firstName,
        "lastName": lastName,
        "dateOfBirth": dateOfBirth,
        "branchId": branchId,
        "departmentId": departmentId,
        "joinDate": joinDate,
        "positionId": positionId,
        "status": status
      }
    });

    try {
      var response = await http.post(
        Uri.parse(uri),
        headers: headers,
        body: body,
      );

      var jsonResponseBody = jsonDecode(response.body);

      if (response.statusCode == 200) {
        APIResponse result = APIResponse.fromJson(jsonResponseBody);

        return result;
      } else {
        return Future.error("Error Server: $jsonResponseBody");
      }
      // ignore: non_constant_identifier_names
    } catch (SocketException) {
      return Future.error("Error Fetching Data !");
    }
  }
}
