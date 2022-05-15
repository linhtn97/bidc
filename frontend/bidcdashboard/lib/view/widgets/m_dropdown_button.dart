import 'package:flutter/material.dart';

class MDropdownButton extends StatefulWidget {
  const MDropdownButton(
      {Key? key,
      required this.dropdownValue,
      required this.onChanged,
      required this.listValue,
      this.width,
      this.lableName})
      : super(key: key);

  final String? dropdownValue;
  final String? lableName;
  final String? Function(String?) onChanged;
  final List<String> listValue;
  final double? width;

  @override
  State<MDropdownButton> createState() => _MDropdownButtonState();
}

class _MDropdownButtonState extends State<MDropdownButton> {
  @override
  void initState() {
    _dropdownValue = widget.dropdownValue;
    super.initState();
  }

  String? _dropdownValue;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: DropdownButton<String>(
        value: _dropdownValue ?? widget.listValue.first,
        icon: const Icon(
          Icons.arrow_drop_down,
          color: Colors.blue,
        ),
        elevation: 16,
        style: const TextStyle(color: Colors.blue),
        underline: Container(
          height: 2,
          color: Colors.blue,
        ),
        onChanged: (String? newValue) {
          widget.onChanged(newValue);
          setState(() {
            _dropdownValue = newValue!;
          });
        },
        items: widget.listValue.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
