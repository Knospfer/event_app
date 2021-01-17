import 'package:event_app/models/event.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventCard extends StatelessWidget {
  final EventModel eventModel;

  EventCard({this.eventModel});

  @override
  Widget build(BuildContext context) {
    return Card(
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(eventModel.imagePath),
                fit: BoxFit.cover,
                alignment: Alignment.topCenter),
          ),
          child: Stack(
            children: [
              Positioned.fill(
                  child: Container(color: Color.fromRGBO(0, 0, 0, 0.3))),
              Padding(padding: EdgeInsets.all(20.0), child: _buildCardBody()),
            ],
          ),
        ));
  }

  _buildCardBody() {
    return Column(
      children: [
        Row(
          children: _buildRow(
              textOne: Text(
                eventModel?.daysInterval?.toString() ?? '0',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 60, color: Colors.white),
              ),
              textTwo: Text(eventModel?.name ?? 'Road Trip',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 28, color: Colors.white))),
        ),
        Padding(padding: EdgeInsets.only(bottom: 20.0)),
        Row(
            children: _buildRow(
                textOne: Text(
                  'Days until',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
                textTwo: Text(
                  DateFormat.yMMMd().format(eventModel.eventDate),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                )))
      ],
    );
  }

  List<Widget> _buildRow({Text textOne, Text textTwo}) {
    return [
      Expanded(
        flex: 3,
        child: textOne,
      ),
      Expanded(
        flex: 9,
        child: textTwo,
      )
    ];
  }
}
