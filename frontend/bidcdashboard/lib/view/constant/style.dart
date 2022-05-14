import 'package:flutter/material.dart';
import 'package:bidcdashboard/view/constant/color.dart';

class StyleDefault {
  static BoxShadow defaultBoxShadow() {
    return BoxShadow(
      color: ColorConstant.shadowColor.withOpacity(0.5),
      spreadRadius: 1,
      blurRadius: 3,
      offset: const Offset(0, 0),
    );
  }

  static BoxDecoration boxDecorationDefault(Color? color) {
    return BoxDecoration(
        color: color ?? ColorConstant.backgroundLightColor,
        boxShadow: [StyleDefault.defaultBoxShadow()],
        borderRadius: const BorderRadius.all(Radius.circular(16)));
  }
}
