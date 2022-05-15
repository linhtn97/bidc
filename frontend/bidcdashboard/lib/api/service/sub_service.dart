import 'package:bidcdashboard/api/model/branch.dart';
import 'package:bidcdashboard/api/model/department.dart';
import 'package:bidcdashboard/api/model/position.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SubService {
  String baseUlr = "http://localhost:8080/api/v1/";
  Map<String, String> get headers => {
        "Content-Type": "application/json",
        "Accept": "application/json",
        // "Authorization": "Bearer " + token,
      };

  Future<List<Branch>> getAllBranch() async {
    var uri = "$baseUlr/branch/get-all";
    try {
      var response = await http.get(
        Uri.parse(uri),
        headers: headers,
      );

      var jsonResponseBody = jsonDecode(response.body);
      if (response.statusCode == 200) {
        var dataJson = jsonResponseBody["data"];
        final List parsed = dataJson;
        List<Branch> temp = parsed.map((e) => Branch.fromJson(e)).toList();

        return temp;
      } else {
        return Future.error("Error Server: ${jsonResponseBody["status"]}");
      }
      // ignore: non_constant_identifier_names
    } catch (SocketException) {
      return Future.error("Error Fetching Data !");
    }
  }

  Future<List<Department>> getAllDepartment() async {
    var uri = "$baseUlr/department/get-all";
    try {
      var response = await http.get(
        Uri.parse(uri),
        headers: headers,
      );

      var jsonResponseBody = jsonDecode(response.body);
      if (response.statusCode == 200) {
        var dataJson = jsonResponseBody["data"];
        final List parsed = dataJson;
        List<Department> temp =
            parsed.map((e) => Department.fromJson(e)).toList();

        return temp;
      } else {
        return Future.error("Error Server: ${jsonResponseBody["status"]}");
      }
      // ignore: non_constant_identifier_names
    } catch (SocketException) {
      return Future.error("Error Fetching Data !");
    }
  }

  Future<List<Position>> getAllPosition() async {
    var uri = "$baseUlr/position/get-all";
    try {
      var response = await http.get(
        Uri.parse(uri),
        headers: headers,
      );

      var jsonResponseBody = jsonDecode(response.body);
      if (response.statusCode == 200) {
        var dataJson = jsonResponseBody["data"];
        final List parsed = dataJson;
        List<Position> temp = parsed.map((e) => Position.fromJson(e)).toList();

        return temp;
      } else {
        return Future.error("Error Server: ${jsonResponseBody["status"]}");
      }
      // ignore: non_constant_identifier_names
    } catch (SocketException) {
      return Future.error("Error Fetching Data !");
    }
  }
}
