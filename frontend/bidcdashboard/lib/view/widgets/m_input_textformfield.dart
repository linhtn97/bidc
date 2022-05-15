import 'package:flutter/material.dart';

class MInputTextFormField extends StatelessWidget {
  const MInputTextFormField({
    Key? key,
    this.textEditingController,
    this.validator,
    required this.labelText,
    this.icon,
    this.width,
    this.height,
    this.maxWidth,
  }) : super(key: key);

  final TextEditingController? textEditingController;
  final String? Function(String?)? validator;
  final String labelText;
  final IconData? icon;
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
          decoration: InputDecoration(
            labelText: labelText,
            prefixIcon: icon == null
                ? null
                : Icon(
                    icon,
                    color: Colors.grey,
                  ),
          ),
        ),
      ),
    );
  }
}
