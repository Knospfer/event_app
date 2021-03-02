import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

typedef OnDataSubmitCallback = void Function(DateTime dateSubmitted);

class MultiplatformPicker extends StatefulWidget {
  final OnDataSubmitCallback onDataSubmitted;

  MultiplatformPicker({this.onDataSubmitted});

  @override
  State<StatefulWidget> createState() => MultiplatformPickerState();
}

class MultiplatformPickerState extends State<MultiplatformPicker> {
  DateTime selectedDate;
  DateTime today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Text(selectedDate == null
          ? 'Select date'
          : new DateFormat.yMMMd().format(selectedDate)),
      onTap: () {
        return _selectPicker(context);
      },
    );
  }

  _selectPicker(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    switch (theme.platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return _showAndroidPicker(context);
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return _showiOSPicker(context);
    }
  }

  _showAndroidPicker(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: today,
      firstDate: today,
      lastDate: DateTime(2030),
      initialEntryMode: DatePickerEntryMode.calendar,
      initialDatePickerMode: DatePickerMode.day,
      helpText: 'Select booking date',
      cancelText: 'Not now',
      confirmText: 'Book',
      errorFormatText: 'Enter valid date',
      errorInvalidText: 'Enter date in valid range',
      fieldLabelText: 'Booking date',
      fieldHintText: 'Month/Date/Year',
      builder: (context, child) {
        return Theme(
          data: ThemeData.light(),
          child: child,
        );
      },
    );
    if (picked != null && picked != selectedDate) {
      widget.onDataSubmitted(picked);
      setState(() {
        selectedDate = picked;
      });
    }
  }

  _showiOSPicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext builder) {
          return Container(
            height: MediaQuery.of(context).copyWith().size.height / 3,
            color: Colors.white,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (picked) {
                if (picked != null && picked != selectedDate) {
                  widget.onDataSubmitted(picked);
                  setState(() {
                    selectedDate = picked;
                  });
                }
              },
              initialDateTime: selectedDate,
              minimumYear: today.year,
              maximumYear: 2030,
            ),
          );
        });
  }
}
