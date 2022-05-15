import 'package:bidcdashboard/api/service/staff_service.dart';
import 'package:bidcdashboard/view/constant/method.dart';
import 'package:bidcdashboard/view/pages/staff_management/date_time_picker.dart';
import 'package:bidcdashboard/view/pages/staff_management/staff_report_controller.dart';
import 'package:bidcdashboard/view/widgets/container_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

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
    200,
    200,
    200,
    200,
    200,
    200,
    200,
    200,
    200,
    200,
    200,
    200
  ];
  StaffReportController staffReportController =
      Get.put(StaffReportController());

  @override
  Widget build(BuildContext context) {
    staffReportController.fetchStaffReport();
    return GetBuilder<StaffReportController>(
        id: 'staffReportId',
        builder: (controller) {
          return StaffReportTableView(
            listHeaderTitle: listHeaderTitle,
            dataTable: controller.staffReports,
            sizeColumnWidth: sizeColumnWidth,
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
          maxHeight: 900,
          // backgroudColor: Colors.green,
          child: Column(
            children: [
              //Search filter
              const SearchStaffReport(),
              SingleChildScrollView(
                controller: scrollHorizontal,
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SingleChildScrollView(
                      controller: scrollVertical,
                      scrollDirection: Axis.vertical,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            // staffReportController.fetchStaffReport();
                                          },
                                          child: const Icon(
                                              Icons.note_add_outlined),
                                        ),
                                        sizedBoxWidthDefault(),
                                        InkWell(
                                          onTap: () {
                                            staffReportController
                                                .fetchStaffReport();
                                          },
                                          child:
                                              const Icon(Icons.replay_outlined),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          sizedBoxHeightDefault(),
                          //grid view table
                          for (int i = 0; i < widget.dataTable.length; i++)
                            MRowData(
                              rowData: widget.dataTable[i],
                              sizeColumnWidth: widget.sizeColumnWidth,
                              indexRow: i,
                            ),
                        ],
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
                        InkWell(
                          onTap: () {},
                          child: const Icon(Icons.edit_note),
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
                              result ? controller.fetchStaffReport() : null;
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
  StaffReportController _staffReportController = StaffReportController();
  DateTimePickerController _dateTimePickerController =
      DateTimePickerController();
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String dateNowString = DateFormat('dd/MM/yyyy').format(now);
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 120,
            height: 45,
            child: TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Search code',
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 120,
            height: 45,
            child: TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Search full name',
              ),
            ),
          ),
        ),
        Container(
          color: Colors.blue[200],
          padding: const EdgeInsets.all(5),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: InkWell(
                  onTap: () {
                    _dateTimePickerController.dateOfBirth.value =
                        !_dateTimePickerController.dateOfBirth.value;

                    if (_dateTimePickerController.dateOfBirth.value == true) {
                      _dateTimePickerController.setValueDateOfBirthNow(
                          dateNowString, dateNowString);
                    }

                    setState(() {});
                  },
                  child: Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                        color: _dateTimePickerController.dateOfBirth.value
                            ? Colors.black
                            : Colors.transparent,
                        border: Border.all(width: 1)),
                  ),
                ),
              ),
              const Text("Date Of Birth"),
              const SizedBox(width: 5),
              const DateTimePicker(
                nameRoute: "preDateOfBirth",
              ),
              const SizedBox(width: 5),
              const Text("To"),
              const SizedBox(width: 5),
              const DateTimePicker(
                nameRoute: "nextDateOfBirth",
              ),
            ],
          ),
        ),
        sizedBoxWidthDefault(),
        Container(
          color: Colors.blue[200],
          padding: const EdgeInsets.all(5),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: InkWell(
                  onTap: () {
                    _dateTimePickerController.joinTime.value =
                        !_dateTimePickerController.joinTime.value;

                    if (_dateTimePickerController.joinTime.value == true) {
                      _dateTimePickerController.setValueJoinTimeNow(
                          dateNowString, dateNowString);
                    }
                    // print(dateTimePickerController.joinTime.value);
                    setState(() {});
                  },
                  child: Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                        color: _dateTimePickerController.joinTime.value
                            ? Colors.black
                            : Colors.transparent,
                        border: Border.all(width: 1)),
                  ),
                ),
              ),
              const Text("Join Time"),
              const SizedBox(width: 5),
              const DateTimePicker(
                nameRoute: "preJoinTime",
              ),
              const SizedBox(width: 5),
              const Text("To"),
              const SizedBox(width: 5),
              const DateTimePicker(
                nameRoute: "nextJoinTime",
              ),
            ],
          ),
        ),
        sizedBoxWidthDefault(),
        btnSearchStaffReport()
      ],
    );
  }
}

class btnSearchStaffReport extends StatelessWidget {
  const btnSearchStaffReport({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StaffReportController staffReportController = StaffReportController();
    DateTimePickerController dateTimePickerController =
        DateTimePickerController();
    return Container(
      decoration:
          const BoxDecoration(color: Colors.amber, shape: BoxShape.circle),
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.all(7),
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: const Icon(Icons.search_outlined),
        ),
      ),
    );
  }
}
