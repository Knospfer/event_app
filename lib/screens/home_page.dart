import 'package:event_app/models/event.dart';
import 'package:event_app/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widget/event_card.dart';

class HomePage extends StatelessWidget {
  final EventModel event = EventModel(
      eventDate: DateTime(2021, 10, 12),
      currentDate: DateTime.now(),
      imagePath: 'https://picsum.photos/200/300',
      name: 'Mock Event');

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'THURSDAY, MARCH 19',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Events',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 30),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RoutesName.detailPage);
              },
              child: EventCard(eventModel: event),
            ))
      ],
    );
  }
}
