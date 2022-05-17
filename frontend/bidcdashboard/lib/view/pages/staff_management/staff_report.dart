import 'package:bidcdashboard/api/api_response.dart';
import 'package:bidcdashboard/api/model/staff.dart';
import 'package:bidcdashboard/api/service/staff_service.dart';
import 'package:bidcdashboard/view/constant/method.dart';
import 'package:bidcdashboard/view/pages/staff_management/create_staff_form.dart';
import 'package:bidcdashboard/view/pages/staff_management/staff_report_controller.dart';
import 'package:bidcdashboard/view/pages/staff_management/update_staff_form.dart';
import 'package:bidcdashboard/view/widgets/container_custom.dart';
import 'package:bidcdashboard/view/widgets/m_dropdown_button.dart';
import 'package:bidcdashboard/view/widgets/m_input_textformfield.dart';
import 'package:bidcdashboard/view/widgets/widget_default.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:url_launcher/url_launcher.dart';

class StaffReport extends StatefulWidget {
  const StaffReport({
    Key? key,
  }) : super(key: key);

  @override
  State<StaffReport> createState() => _StaffReportState();
}

class _StaffReportState extends State<StaffReport> {
  var listHeaderTitle = [
    "stt",
    "code",
    "first Name",
    "last Name",
    "date Of Birth",
    "join Date",
    "status",
    "branch",
    "department",
    "position",
  ];
  List<double> sizeColumnWidth = [
    50,
    140,
    160,
    160,
    160,
    160,
    160,
    160,
    160,
    160,
    160,
    160,
    120
  ];
  StaffReportController staffReportController =
      Get.put(StaffReportController());

  @override
  Widget build(BuildContext context) {
    staffReportController.fetchStaffReport(
        null, null, null, null, null, null, 1);
    return GetBuilder<StaffReportController>(
        id: 'staffReportId',
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PageTitle(title: "Staff Management / Report"),
              sizedBoxHeightDefault(),
              StaffReportTableView(
                listHeaderTitle: listHeaderTitle,
                dataTable: controller.staffReports,
                sizeColumnWidth: sizeColumnWidth,
              ),
            ],
          );
        });
  }
}

class StaffReportTableView extends StatefulWidget {
  const StaffReportTableView({
    Key? key,
    required this.listHeaderTitle,
    required this.dataTable,
    required this.sizeColumnWidth,
  }) : super(key: key);

  final List<String> listHeaderTitle;
  final List<List<String>> dataTable;
  final List<double> sizeColumnWidth;

  @override
  State<StaffReportTableView> createState() => _StaffReportTableViewState();
}

class _StaffReportTableViewState extends State<StaffReportTableView> {
  StaffReportController staffReportController =
      Get.put(StaffReportController());

  @override
  Widget build(BuildContext context) {
    ScrollController scrollHorizontal = ScrollController();
    ScrollController scrollVertical = ScrollController();

    return Obx(() => ContainerCustom(
          maxHeight: 600,
          // backgroudColor: Colors.green,
          child: SingleChildScrollView(
            controller: scrollHorizontal,
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Search filter
                    const SearchStaffReport(),
                    sizedBoxHeightDefault(),
                    //header table
                    Container(
                      height: 40,
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: Colors.amber.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          for (int i = 0;
                              i < widget.listHeaderTitle.length;
                              i++)
                            Container(
                              width: widget.sizeColumnWidth[i],
                              decoration: const BoxDecoration(
                                border: Border.symmetric(
                                  vertical: BorderSide(width: 0.1),
                                ),
                              ),
                              child: Center(
                                heightFactor: 2.3,
                                child: Text(
                                  widget.listHeaderTitle[i].toUpperCase(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          SizedBox(
                            width: 120,
                            child: Center(
                              heightFactor: 2.3,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      // staffReportController.fetchStaffReport();
                                      showDialog<String>(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            const AlertDialog(
                                          content: CreateStaffForm(),
                                          // const Text('AlertDialog description'),
                                          // actions: <Widget>[
                                          //   TextButton(
                                          //     onPressed: () =>
                                          //         Navigator.pop(context, 'OK'),
                                          //     child: const Text('OK'),
                                          //   ),
                                          // ],
                                        ),
                                      );
                                    },
                                    child: const Icon(Icons.note_add_outlined),
                                  ),
                                  // sizedBoxWidthDefault(),
                                  // InkWell(
                                  //   onTap: () {
                                  //     staffReportController.fetchStaffReport(
                                  //         null,
                                  //         null,
                                  //         null,
                                  //         null,
                                  //         null,
                                  //         null,
                                  //         1);
                                  //   },
                                  //   child: const Icon(Icons.replay_outlined),
                                  // )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    sizedBoxHeightDefault(),
                    //grid view table
                    Expanded(
                      child: SingleChildScrollView(
                        controller: scrollVertical,
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            for (int i = 0; i < widget.dataTable.length; i++)
                              MRowData(
                                rowData: widget.dataTable[i],
                                sizeColumnWidth: widget.sizeColumnWidth,
                                indexRow: i,
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

class MRowData extends StatefulWidget {
  const MRowData(
      {Key? key,
      required this.rowData,
      required this.sizeColumnWidth,
      required this.indexRow})
      : super(key: key);

  final int indexRow;
  final List<String> rowData;
  final List<double> sizeColumnWidth;

  @override
  State<MRowData> createState() => _MRowDataState();
}

class _MRowDataState extends State<MRowData> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<StaffReportController>(
        builder: (controller) => Container(
              height: 40,
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.only(bottom: 3),
              //element
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      border: Border.symmetric(
                        vertical: BorderSide(width: 0.1),
                      ),
                    ),
                    width: widget.sizeColumnWidth[0],
                    padding: const EdgeInsets.all(10.0),
                    child: Text("${widget.indexRow}"),
                  ),
                  for (int i = 1; i < widget.rowData.length; i++)
                    Container(
                      decoration: const BoxDecoration(
                        border: Border.symmetric(
                          vertical: BorderSide(width: 0.1),
                        ),
                      ),
                      width: widget.sizeColumnWidth[i],
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        widget.rowData[i].toString(),
                        style: const TextStyle(overflow: TextOverflow.ellipsis),
                      ),
                    ),
                  SizedBox(
                    width: 120,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 45,
                          child: InkWell(
                            onTap: () async {
                              // print("edit");
                              StaffService staffService = StaffService();
                              APIResponse result = await staffService
                                  .findById(widget.rowData[0]);

                              Map<dynamic, dynamic> a = result.data;

                              Staff staffIndo = Staff.fromJson(a);

                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Edit'),
                                  content: UpdateStaffForm(staff: staffIndo),
                                  // const Text('AlertDialog description'),
                                  // actions: <Widget>[
                                  //   TextButton(
                                  //     onPressed: () =>
                                  //         Navigator.pop(context, 'OK'),
                                  //     child: const Text('OK'),
                                  //   ),
                                  // ],
                                ),
                              );

                              // Staff.fromJson(result.data)
                            },
                            child: const Icon(Icons.edit_note_outlined),
                          ),
                        ),
                        sizedBoxWidthDefault(),
                        SizedBox(
                          height: 45,
                          child: InkWell(
                            onTap: () async {
                              StaffService staffService = StaffService();

                              ///waiting dialog...
                              bool result = await staffService
                                  .deleteOne(widget.rowData[0]);
                              result
                                  ? controller.fetchStaffReport(
                                      null, null, null, null, null, null, 1)
                                  : null;
                            },
                            child: const Icon(Icons.delete_outlined),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ));
  }
}

class SearchStaffReport extends StatefulWidget {
  const SearchStaffReport({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchStaffReport> createState() => _SearchStaffReportState();
}

class _SearchStaffReportState extends State<SearchStaffReport> {
  final TextEditingController _codeTEC = TextEditingController();
  final TextEditingController _nameTEC = TextEditingController();
  //
  final TextEditingController _preDateOfBirthTEC = TextEditingController();
  final TextEditingController _nextDateOfBirthTEC = TextEditingController();
  final TextEditingController _prejoinDateTEC = TextEditingController();
  final TextEditingController _nextjoinDateTEC = TextEditingController();
  // String preDateOfBirth = "";
  // String nextDateOfBirth = "";
  // String preJoinDate = "";
  // String nextJoinDate = "";
  int _status = 1;

  void _launchUrl(String urlDownloadFile) async {
    Uri url = Uri.parse(urlDownloadFile);
    if (!await launchUrl(url)) throw 'Could not launch $url';
  }

  StaffService staffService = StaffService();

  @override
  Widget build(BuildContext context) {
    // print("_status $_status");
    DateTime now = DateTime.now();
    int yearNow = int.parse(DateFormat('yyyy').format(now));
    int monthNow = int.parse(DateFormat('MM').format(now));
    int dayNow = int.parse(DateFormat('dd').format(now));
    return GetBuilder<StaffReportController>(
      id: 'searchStaffReportId',
      builder: (controller) => Row(
        children: [
          MInputTextFormField(
            textEditingController: _codeTEC,
            labelText: "Search Code",
            width: 160,
          ),
          sizedBoxWidthDefault(),
          MInputTextFormField(
            textEditingController: _nameTEC,
            labelText: "Search Name",
            width: 160,
          ),
          sizedBoxWidthDefault(),
          SizedBox(
            width: 160,
            child: DateTimePicker(
              controller: _preDateOfBirthTEC,
              firstDate: DateTime(1900),
              lastDate: DateTime(yearNow, monthNow, dayNow),
              dateLabelText: 'Pre Date Of Birth',
              onChanged: (val) {
                // preDateOfBirth = val;
              },
              validator: (val) {
                return null;
              },
              onSaved: (val) {},
            ),
          ),
          sizedBoxWidthDefault(),
          SizedBox(
            width: 160,
            child: DateTimePicker(
              controller: _nextDateOfBirthTEC,
              firstDate: DateTime(1900),
              lastDate: DateTime(yearNow, monthNow, dayNow),
              dateLabelText: 'Next Date Of Birth',
              onChanged: (val) {
                // nextDateOfBirth = val;
              },
              validator: (val) {
                return null;
              },
              onSaved: (val) {},
            ),
          ),
          sizedBoxWidthDefault(),
          SizedBox(
            width: 160,
            child: DateTimePicker(
              controller: _prejoinDateTEC,
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
              dateLabelText: 'Pre Join Date',
              onChanged: (val) {
                // preJoinDate = val;
              },
              validator: (val) {
                return null;
              },
              onSaved: (val) {},
            ),
          ),
          sizedBoxWidthDefault(),
          SizedBox(
            width: 160,
            child: DateTimePicker(
              controller: _nextjoinDateTEC,
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
              dateLabelText: 'Next Join Date',
              onChanged: (val) {
                // nextJoinDate = val;
              },
              validator: (val) {
                return null;
              },
              onSaved: (val) {},
            ),
          ),
          sizedBoxWidthDefault(),
          MDropdownButton(
            width: 100,
            dropdownValue: _status == -1
                ? 'All'
                : _status == 1
                    ? 'Working'
                    : _status == 2
                        ? 'Has Retired'
                        : null,
            listValue: const <String>['All', 'Working', 'Has Retired'],
            onChanged: (String? newValue) {
              switch (newValue) {
                case 'All':
                  _status = -1;
                  break;
                case 'Working':
                  _status = 1;
                  break;
                case 'Has Retired':
                  _status = 2;
                  break;
              }
              return null;
            },
          ),
          sizedBoxWidthDefault(),
          Container(
            decoration:
                const BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
            child: InkWell(
              onTap: () {
                controller.fetchStaffReport(
                  _codeTEC.text,
                  _nameTEC.text,
                  _preDateOfBirthTEC.text,
                  _nextDateOfBirthTEC.text,
                  _prejoinDateTEC.text,
                  _nextjoinDateTEC.text,
                  _status,
                );
              },
              child: Container(
                padding: const EdgeInsets.all(7),
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: const Icon(Icons.search_outlined, color: Colors.white),
              ),
            ),
          ),
          sizedBoxWidthDefault(),
          Container(
            decoration:
                const BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
            child: InkWell(
              onTap: () {
                controller.fetchStaffReport(
                    null, null, null, null, null, null, 1);
                setState(() {
                  _codeTEC.text = "";
                  _nameTEC.text = "";
                  _preDateOfBirthTEC.text = "";
                  _nextDateOfBirthTEC.text = "";
                  _prejoinDateTEC.text = "";
                  _nextjoinDateTEC.text = "";
                  _status = 1;
                });
              },
              child: Container(
                padding: const EdgeInsets.all(7),
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: const Icon(Icons.refresh_outlined, color: Colors.white),
              ),
            ),
          ),
          sizedBoxWidthDefault(),
          SizedBox(
            child: InkWell(
              onTap: () async {
                APIResponse apiResponse = await staffService.exportExcelReport(
                  _codeTEC.text,
                  _nameTEC.text,
                  _preDateOfBirthTEC.text,
                  _nextDateOfBirthTEC.text,
                  _prejoinDateTEC.text,
                  _nextjoinDateTEC.text,
                  _status,
                );

                var res = apiResponse.data["downloadURL"];
                // print(res);
                // js.context.callMethod(
                //     'open', [url, '_self']); //<= find explanation below
                String urlF = res.toString();
                _launchUrl(urlF);
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                color: Colors.blue,
                child: Row(
                  children: const [
                    Icon(Icons.download_outlined, color: Colors.white),
                    SizedBox(width: 7),
                    Text("Export Excel",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
