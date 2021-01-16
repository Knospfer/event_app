import 'package:flutter/material.dart';

class EventModel {
  DateTime eventDate;
  DateTime currentDate;
  String name;
  String imagePath;

  //  not accurate
  int get daysRemaining {
    return DateTimeRange(start: currentDate, end: eventDate).duration.inDays +
        1;
  }

  //  not accurate
  int get monthRemaining {
    return (daysRemaining ~/ 30).toInt();
  }

  EventModel({this.eventDate, this.currentDate, this.name, this.imagePath});
}
