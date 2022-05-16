import 'package:bidcdashboard/view/constant/size.dart';
import 'package:flutter/material.dart';

class ContainerCustom extends StatelessWidget {
  const ContainerCustom({
    Key? key,
    this.width,
    this.backgroudColor,
    this.padding,
    this.child,
    this.height,
    this.margin,
    this.boxShadowColor,
    this.maxHeight,
    this.maxWidth,
  }) : super(key: key);

  final double? width;
  final double? height;
  final double? maxHeight;
  final double? maxWidth;
  final EdgeInsetsGeometry? margin;

  final Widget? child;
  final Color? backgroudColor;
  final EdgeInsetsGeometry? padding;
  final Color? boxShadowColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      constraints: BoxConstraints(
        maxHeight: maxHeight ?? double.infinity,
        maxWidth: maxWidth ?? double.infinity,
      ),
      padding: padding ?? const EdgeInsets.all(SizeConstant.defaultPadding),
      margin: margin,
      decoration: BoxDecoration(
        color: backgroudColor ?? Colors.white,
        borderRadius: const BorderRadius.all(
            Radius.circular(SizeConstant.defaultPadding / 2)),
        boxShadow: [
          BoxShadow(
            color: boxShadowColor ?? Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: child ?? const SizedBox(),
    );
  }
}
