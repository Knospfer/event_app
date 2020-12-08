class EventModel {
  DateTime eventDate;
  DateTime currentDate;
  String name;
  String imagePath;

//todo check
  int get timeRemaining {
    return eventDate.millisecond - currentDate.millisecond;
  }

  EventModel({this.eventDate, this.currentDate, this.name, this.imagePath});
}
