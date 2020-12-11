import 'package:event_app/models/event.dart';
import 'package:event_app/widget/event_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//todo card updated real time

class AddPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AddState();
  }
}

class AddState extends State<AddPage> {
  final EventModel event = EventModel(
      eventDate: DateTime(2021, 10, 12),
      currentDate: DateTime.now(),
      imagePath: 'https://picsum.photos/200/300',
      name: 'Mock Event');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
              padding: EdgeInsets.fromLTRB(20, 40, 20, 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Add New Event',
                        style: TextStyle(
                            fontSize: 26.0, fontWeight: FontWeight.bold),
                      ),
                      Icon(Icons.close_outlined)
                    ],
                  ),
                  _buildPaddedCard(),
                ],
              )),
          Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                width: double.infinity,
                decoration: _containerDecoration(),
                child: Column(
                  children: [
                    Text('Title'),
                    Text('Road trip...'),
                    Text('Date & Time'),
                    Text('Date picker'),
                    Text('Background'),
                    Text('Image pickers'),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.black)),
                      onPressed: null,
                      child: Text(
                        'Save',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }

  _buildPaddedCard() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 20.0),
      child: EventCard(
        eventModel: event,
      ),
    );
  }

  _containerDecoration() {
    return BoxDecoration(
        boxShadow: [
          BoxShadow(
              blurRadius: 10.0, color: Colors.grey[200], spreadRadius: 10.0)
        ],
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.0), topRight: Radius.circular(40.0)));
  }
}
