import 'package:bidcdashboard/api/dto/staff_report_dto.dart';
import 'package:bidcdashboard/api/service/staff_service.dart';
import 'package:bidcdashboard/view/constant/method.dart';
import 'package:bidcdashboard/view/widgets/container_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

class StaffReportController extends GetxController {
  //static MenuController instance = Get.find();
  StaffService staffService = StaffService();
  List<List<String>> staffReports = [
    [""]
  ].obs;

  // setStaffReports(var data) {
  //   this.staffReports = data;
  // }

  fetchStaffReport() async {
    staffReports.clear();
    List<StaffReportDTO> futureGetStaffReport =
        await staffService.searchByFilter();
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
          child: SingleChildScrollView(
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
                      //Search filter
                      Row(
                        children: [
                          Text("Full Name: "),
                        ],
                      ),
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
                                      },
                                      child: Icon(Icons.note_add_outlined),
                                    ),
                                    sizedBoxWidthDefault(),
                                    InkWell(
                                      onTap: () {
                                        staffReportController
                                            .fetchStaffReport();
                                      },
                                      child: Icon(Icons.replay_outlined),
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
                              ;
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
