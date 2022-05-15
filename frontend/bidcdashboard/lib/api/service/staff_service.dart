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
      String? preJoinTime,
      String? nextJoinTime,
      int? status) async {
    var uri = "$baseUlr/search-by-filter";

    if (code == "") code = null;
    if (fullName == "") fullName = null;
    if (preDateOfBirth == "") preDateOfBirth = null;
    if (nextDateOfBirth == "") nextDateOfBirth = null;
    if (preJoinTime == "") preJoinTime = null;
    if (nextJoinTime == "") nextJoinTime = null;

    var body = jsonEncode(<dynamic, dynamic>{
      "objFil": {
        "code": code,
        "fullName": fullName,
        "preDateOfBirth": preDateOfBirth,
        "nextDateOfBirth": nextDateOfBirth,
        "preJoinTime": preJoinTime,
        "nextJoinTime": nextJoinTime,
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
}
