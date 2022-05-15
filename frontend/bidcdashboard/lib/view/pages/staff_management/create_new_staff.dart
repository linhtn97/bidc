import 'package:bidcdashboard/api/api_response.dart';
import 'package:bidcdashboard/api/service/staff_service.dart';
import 'package:bidcdashboard/view/constant/method.dart';
import 'package:bidcdashboard/view/widgets/container_custom.dart';
import 'package:bidcdashboard/view/widgets/m_dropdown_button.dart';
import 'package:bidcdashboard/view/widgets/m_input_textformfield.dart';
import 'package:bidcdashboard/view/widgets/widget_default.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

class CreateNewStaff extends StatelessWidget {
  const CreateNewStaff({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PageTitle(title: "Staff Management / Add"),
        sizedBoxHeightDefault(),
        const CreateNewStaffForm()
      ],
    );
  }
}

class CreateNewStaffForm extends StatefulWidget {
  const CreateNewStaffForm({
    Key? key,
  }) : super(key: key);

  @override
  State<CreateNewStaffForm> createState() => _CreateNewStaffFormState();
}

class _CreateNewStaffFormState extends State<CreateNewStaffForm> {
  final TextEditingController _codeTEC = TextEditingController();
  final TextEditingController _firstNameTEC = TextEditingController();
  final TextEditingController _lastNameTEC = TextEditingController();
  final _globalKeysStaffForm = GlobalKey<FormState>();
  String _dateOfBirthPicker = "";
  String _joinDatePicker = "";
  int _statusDropdownValue = 1;
  int _branchDropdownValue = 1;
  int _departmentDropdownValue = 1;
  int _positionDropdownValue = 1;
  StaffService staffService = StaffService();

  @override
  Widget build(BuildContext context) {
    //Size sizeContext = MediaQuery.of(context).size;
    return ContainerCustom(
      child: Form(
        key: _globalKeysStaffForm,
        child: SizedBox(
          height: 700,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    MInputTextFormField(
                      textEditingController: _codeTEC,
                      labelText: "Code",
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
                        initialValue: '',
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                        dateLabelText: 'Date Of Birth',
                        onChanged: (val) {
                          _dateOfBirthPicker = val;
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
                        initialValue: '',
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                        dateLabelText: 'Join Date',
                        onChanged: (val) {
                          _joinDatePicker = val;
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
                      dropdownValue: "Manager",
                      listValue: const <String>["Manager", "Branch Director"],
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
                    SizedBox(
                      height: 40,
                      width: 200,
                      child: ElevatedButton(
                          onPressed: () async {
                            APIResponse result = await staffService.createOne(
                              _codeTEC.text,
                              _firstNameTEC.text,
                              _lastNameTEC.text,
                              _dateOfBirthPicker,
                              _branchDropdownValue,
                              _departmentDropdownValue,
                              _positionDropdownValue,
                              _joinDatePicker,
                              _statusDropdownValue,
                            );

                            if (result.status == 200) {}
                          },
                          child: const Text("Create New !")),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
