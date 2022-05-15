import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DateTimePickerController extends GetxController {
  RxBool dateOfBirth = false.obs;
  RxString preDateOfBirth = "".obs;
  RxString nextDateOfBirth = "".obs;
  RxBool joinTime = false.obs;
  RxString preJoinTime = "".obs;
  RxString nextJoinTime = "".obs;

  setValueDateOfBirthNow(String pre, String now) {
    preDateOfBirth.value = pre;
    nextDateOfBirth.value = now;
  }

  setValueJoinTimeNow(String pre, String now) {
    preDateOfBirth.value = pre;
    nextDateOfBirth.value = now;
  }

  setValueDateTimePicker(String nameRoute, String value) {
    switch (nameRoute) {
      case "preDateOfBirth":
        preDateOfBirth.value = value;
        break;
      case "nextDateOfBirth":
        // do something else
        nextDateOfBirth.value = value;
        break;
      case "preJoinTime":
        preJoinTime.value = value;
        break;
      case "nextJoinTime":
        // do something else
        nextJoinTime.value = value;
        break;
    }
  }
}

class DateTimePicker extends StatefulWidget {
  const DateTimePicker({Key? key, this.restorationId, required this.nameRoute})
      : super(key: key);

  final String nameRoute;

  final String? restorationId;

  @override
  State<DateTimePicker> createState() => _DateTimePickerState();
}

/// RestorationProperty objects can be used because of RestorationMixin.
class _DateTimePickerState extends State<DateTimePicker> with RestorationMixin {
  String textEditingController = "";
  // In this example, the restoration ID for the mixin is passed in through
  // the [StatefulWidget]'s constructor.
  @override
  String? get restorationId => widget.restorationId;

  final RestorableDateTime _selectedDate =
      RestorableDateTime(DateTime(2021, 7, 25));
  late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture =
      RestorableRouteFuture<DateTime?>(
    onComplete: _selectDate,
    onPresent: (NavigatorState navigator, Object? arguments) {
      return navigator.restorablePush(
        _datePickerRoute,
        arguments: _selectedDate.value.millisecondsSinceEpoch,
      );
    },
  );

  static Route<DateTime> _datePickerRoute(
    BuildContext context,
    Object? arguments,
  ) {
    return DialogRoute<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DatePickerDialog(
          restorationId: 'date_picker_dialog',
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          initialDate: DateTime.fromMillisecondsSinceEpoch(arguments! as int),
          firstDate: DateTime(2021),
          lastDate: DateTime(2022),
        );
      },
    );
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedDate, 'selected_date');
    registerForRestoration(
        _restorableDatePickerRouteFuture, 'date_picker_route_future');
  }

  void _selectDate(DateTime? newSelectedDate) {
    if (newSelectedDate != null) {
      setState(
        () {
          textEditingController =
              '${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}';
          _selectedDate.value = newSelectedDate;
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
                'Selected: ${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}'),
          ));
        },
      );
    }
  }

  final DateTimePickerController dateTimePickerController =
      Get.put(DateTimePickerController());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: OutlinedButton(
        onPressed: () {
          dateTimePickerController.setValueDateTimePicker(
              widget.nameRoute, textEditingController);
          _restorableDatePickerRouteFuture.present();
        },
        child: Text(textEditingController),
      ),
    );
  }
}
