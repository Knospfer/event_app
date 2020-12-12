import 'package:event_app/models/event.dart';
import 'package:event_app/routes.dart';
import 'package:flutter/material.dart';

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
          child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RoutesName.detailPage);
              },
              child: Stack(
                children: [
                  Positioned.fill(
                      child: Container(color: Color.fromRGBO(0, 0, 0, 0.3))),
                  Padding(
                      padding: EdgeInsets.all(20.0), child: _buildCardBody()),
                ],
              )),
        ));
  }

  _buildCardBody() {
    return Column(
      children: [
        Row(
          children: _buildRow(
              textOne: Text(
                '42',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 60, color: Colors.white),
              ),
              textTwo: Text('Surf',
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
                  '21:47 PM - Fri May 1 2020',
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
