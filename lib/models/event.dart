import 'package:flutter/material.dart';

class EventModel {
  DateTime eventDate;
  DateTime currentDate;
  String name;
  String imagePath;

  int get timeRemaining {
    return DateTimeRange(start: currentDate, end: eventDate).duration.inDays;
  }

  EventModel({this.eventDate, this.currentDate, this.name, this.imagePath});
}
