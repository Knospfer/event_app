import 'package:flutter/material.dart';

class EventModel {
  int id;
  DateTime eventDate;
  DateTime currentDate;
  String name;
  String imagePath;

  //  not accurate
  int get daysInterval {
    return DateTimeRange(start: currentDate, end: eventDate).duration.inDays +
        1;
  }

  //  not accurate
  int get monthRemaining {
    return (daysInterval ~/ 30).toInt();
  }

  EventModel(
      {this.id, this.eventDate, this.currentDate, this.name, this.imagePath});

  factory EventModel.fromMap(int id, Map<String, dynamic> map) {
    return EventModel(
        id: id,
        eventDate: DateTime.parse(map['eventDate']),
        currentDate: DateTime.now(),
        name: map['name'],
        imagePath: map['imagePath']);
  }

  Map<String, dynamic> toMap() {
    return {
      'eventDate': this.eventDate.toString(),
      'name': this.name,
      'imagePath': this.imagePath
    };
  }
}
