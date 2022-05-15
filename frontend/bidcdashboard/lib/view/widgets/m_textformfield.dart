import 'package:flutter/material.dart';

class MTextFormField extends StatelessWidget {
  const MTextFormField({
    Key? key,
    required this.validator,
    required this.labelText,
    required this.icon,
    required this.textEditingController,
    this.width,
    this.height,
    this.maxWidth,
  }) : super(key: key);

  final TextEditingController textEditingController;
  final String? Function(String?)? validator;
  final String labelText;
  final IconData icon;
  final double? width;
  final double? height;
  final double? maxWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth ?? 380),
        child: TextFormField(
          controller: textEditingController,
          validator: validator,
          style: const TextStyle(fontSize: 18, color: Colors.black),
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            errorStyle: const TextStyle(color: Colors.black),
            contentPadding: const EdgeInsets.symmetric(vertical: 1),
            focusedBorder: focusedOutlineInputBorder,
            enabledBorder: ebableOutlineInputBorder,
            errorBorder: ebableOutlineInputBorder,
            focusedErrorBorder: focusedOutlineInputBorder,
            labelText: labelText,
            labelStyle: labelTextStyle,
            prefixIcon: Icon(
              icon,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

var focusedOutlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(30),
  borderSide: const BorderSide(
    color: Colors.black,
    width: 1.6,
  ),
);
var ebableOutlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(30),
  borderSide: const BorderSide(
    color: Colors.black,
  ),
);
const labelTextStyle = TextStyle(
  color: Colors.black,
  fontSize: 16,
);
