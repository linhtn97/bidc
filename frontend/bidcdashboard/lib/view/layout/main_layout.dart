import 'package:flutter/material.dart';
import 'package:bidcdashboard/view/constant/size.dart';
import 'package:bidcdashboard/view/layout/responsive.dart';

//layout for dashboard
class MainLayout extends StatelessWidget {
  const MainLayout({
    Key? key,
    this.header,
    this.headerFloat,
    this.leftSide,
    this.mainSide,
    this.rightSide,
  }) : super(key: key);

  final Widget? header;
  final Widget? headerFloat;
  final Widget? leftSide;
  final Widget? mainSide;
  final Widget? rightSide;

  @override
  Widget build(BuildContext context) {
    List<int> flex = [0, 3, 0];
    return Stack(
      children: [
        Column(
          children: [
            header ??
                Container(
                  color: Colors.transparent,
                  height: SizeConstant.defaultHeightHeader,
                  child: const Text("header"),
                ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Responsive.isDesktop(context)
                      ? Expanded(
                          flex: flex[0],
                          child: leftSide ??
                              Container(
                                color: Colors.blue,
                                child: Column(
                                  children: const [
                                    Text("left side"),
                                  ],
                                ),
                              ),
                        )
                      : const SizedBox(),
                  Expanded(
                    flex: flex[1],
                    child: mainSide ??
                        Container(
                          color: Colors.yellow,
                          child: Column(
                            children: const [
                              Text("main side"),
                            ],
                          ),
                        ),
                  ),
                  Responsive.isDesktop(context)
                      ? Expanded(
                          flex: flex[2],
                          child: rightSide ??
                              Container(
                                color: Colors.green,
                                child: Column(
                                  children: const [
                                    Text("right side"),
                                  ],
                                ),
                              ),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ],
        ),
        headerFloat ??
            Container(
              color: Colors.blue,
              height: SizeConstant.defaultHeightHeader,
              child: Row(
                children: const [
                  Text("header Float"),
                ],
              ),
            ),
      ],
    );
  }
}
