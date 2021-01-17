import 'package:flutter/material.dart';

class EventModel {
  int id;
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

  EventModel(
      {this.id, this.eventDate, this.currentDate, this.name, this.imagePath});

  factory EventModel.fromMap(int id, Map<String, dynamic> map) {
    return EventModel(
        id: id,
        eventDate: map['eventDate'],
        currentDate: DateTime.now(),
        name: map['eventDate'],
        imagePath: map['eventDate']);
  }

  Map<String, dynamic> toMap() {
    return {
      'eventDate': this.eventDate,
      'name': this.name,
      'imagePath': this.imagePath
    };
  }
}
