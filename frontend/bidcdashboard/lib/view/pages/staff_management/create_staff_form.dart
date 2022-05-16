import 'package:bidcdashboard/api/api_response.dart';
import 'package:bidcdashboard/api/service/staff_service.dart';
import 'package:bidcdashboard/view/constant/method.dart';
import 'package:bidcdashboard/view/pages/staff_management/staff_report_controller.dart';
import 'package:bidcdashboard/view/widgets/container_custom.dart';
import 'package:bidcdashboard/view/widgets/m_dropdown_button.dart';
import 'package:bidcdashboard/view/widgets/m_input_textformfield.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CreateStaffForm extends StatefulWidget {
  const CreateStaffForm({
    Key? key,
  }) : super(key: key);

  @override
  State<CreateStaffForm> createState() => _CreateStaffFormState();
}

class _CreateStaffFormState extends State<CreateStaffForm> {
  final TextEditingController _codeTEC = TextEditingController();
  final TextEditingController _firstNameTEC = TextEditingController();
  final TextEditingController _lastNameTEC = TextEditingController();
  //
  final TextEditingController _dateOfBirthTEC = TextEditingController();
  final TextEditingController _joinDateTEC = TextEditingController();

  final _globalKeysStaffForm = GlobalKey<FormState>();
  // String _dateOfBirthPicker = "";
  // String _joinDatePicker = "";
  int _statusDropdownValue = 1;
  int _branchDropdownValue = 1;
  int _departmentDropdownValue = 1;
  int _positionDropdownValue = 1;
  StaffService staffService = StaffService();
  StaffReportController staffReportController =
      Get.put(StaffReportController());

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    int yearNow = int.parse(DateFormat('yyyy').format(now));
    int monthNow = int.parse(DateFormat('MM').format(now));
    int dayNow = int.parse(DateFormat('dd').format(now));

    // print("formatDate $yearNow - $monthNow -$dayNow ");
    //Size sizeContext = MediaQuery.of(context).size;
    return ContainerCustom(
      width: 600,
      child: Form(
        key: _globalKeysStaffForm,
        child: SingleChildScrollView(
          child: SizedBox(
            height: 700,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    MInputTextFormField(
                      textEditingController: _codeTEC,
                      labelText: "Code",
                      validator: (val) => (val == null || val == "")
                          ? 'Code must be not empty'
                          : null,
                      width: 280,
                    ),
                    sizedBoxHeightDefault(),
                    MInputTextFormField(
                      textEditingController: _firstNameTEC,
                      labelText: "First Name",
                      width: 280,
                    ),
                    sizedBoxHeightDefault(),
                    MInputTextFormField(
                      textEditingController: _lastNameTEC,
                      labelText: "Last Name",
                      width: 280,
                    ),
                    sizedBoxHeightDefault(),
                    SizedBox(
                      width: 280,
                      child: DateTimePicker(
                        controller: _dateOfBirthTEC,
                        firstDate: DateTime(1900),
                        lastDate: DateTime(yearNow, monthNow, dayNow),
                        dateLabelText: 'Date Of Birth',
                        onChanged: (val) {
                          // _dateOfBirthPicker = val;
                        },
                        validator: (val) {
                          return null;
                        },
                        onSaved: (val) {},
                      ),
                    ),
                    sizedBoxHeightDefault(),
                    SizedBox(
                      width: 280,
                      child: DateTimePicker(
                        controller: _joinDateTEC,
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100),
                        dateLabelText: 'Join Date',
                        onChanged: (val) {
                          // _joinDatePicker = val;
                        },
                        validator: (val) {
                          return null;
                        },
                        onSaved: (val) {},
                      ),
                    ),
                    sizedBoxHeightDefault(),
                    MDropdownButton(
                      width: 280,
                      dropdownValue: 'Working',
                      listValue: const <String>['Working', 'Has Retired'],
                      onChanged: (String? newValue) {
                        switch (newValue) {
                          case 'Working':
                            _statusDropdownValue = 1;
                            break;
                          case 'Has Retired':
                            _statusDropdownValue = 2;
                            break;
                        }
                        return null;
                      },
                    ),
                    MDropdownButton(
                      width: 280,
                      dropdownValue: "Headquarters",
                      listValue: const <String>[
                        "Headquarters",
                        "Phnom Penh Branch",
                        "Siem Reap Branch"
                      ],
                      onChanged: (String? newValue) {
                        switch (newValue) {
                          case "Headquarters":
                            _branchDropdownValue = 1;
                            break;
                          case 'Phnom Penh Branch':
                            _branchDropdownValue = 2;
                            break;
                          case 'Siem Reap Branch':
                            _branchDropdownValue = 3;
                            break;
                        }
                        return null;
                      },
                    ),
                    MDropdownButton(
                      width: 280,
                      dropdownValue: "CNTT",
                      listValue: const <String>["CNTT", "Digital Bank"],
                      onChanged: (String? newValue) {
                        switch (newValue) {
                          case "CNTT":
                            _departmentDropdownValue = 1;
                            break;
                          case 'Digital Bank':
                            _departmentDropdownValue = 2;
                            break;
                        }

                        return null;
                      },
                    ),
                    MDropdownButton(
                      width: 280,
                      dropdownValue: "Officer",
                      listValue: const <String>[
                        "Officer",
                        "Manager",
                        "Branch Director"
                      ],
                      onChanged: (String? newValue) {
                        switch (newValue) {
                          case "Manager":
                            _positionDropdownValue = 1;
                            break;
                          case 'Branch Director':
                            _positionDropdownValue = 2;
                            break;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 50),
                    Row(
                      children: [
                        SizedBox(
                          height: 40,
                          width: 120,
                          child: ElevatedButton(
                              onPressed: () async {
                                if (_globalKeysStaffForm.currentState!
                                    .validate()) {
                                  APIResponse result =
                                      await staffService.createOne(
                                    _codeTEC.text,
                                    _firstNameTEC.text,
                                    _lastNameTEC.text,
                                    _dateOfBirthTEC.text,
                                    _branchDropdownValue,
                                    _departmentDropdownValue,
                                    _positionDropdownValue,
                                    _joinDateTEC.text,
                                    _statusDropdownValue,
                                  );

                                  if (result.status == 200) {
                                    staffReportController.reloadStaffReport();
                                    Navigator.pop(context, 'Cancel');
                                  }
                                }
                              },
                              child: const Text("Add")),
                        ),
                        sizedBoxWidthDefault(),
                        SizedBox(
                          height: 40,
                          width: 100,
                          child: ElevatedButton(
                              onPressed: () async {
                                setState(() {
                                  _codeTEC.text = "";
                                  _firstNameTEC.text = "";
                                  _lastNameTEC.text = "";
                                  _dateOfBirthTEC.text = "";
                                  _joinDateTEC.text = "";
                                  // _dateOfBirthPicker = "";
                                  // _joinDatePicker = "";
                                });
                              },
                              child: const Text("Refresh")),
                        ),
                        sizedBoxWidthDefault(),
                        SizedBox(
                          height: 40,
                          width: 100,
                          child: ElevatedButton(
                              onPressed: () => Navigator.pop(context, 'Cancel'),
                              child: const Text("Cancel")),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
