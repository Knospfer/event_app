import 'package:event_app/models/event.dart';
import 'package:event_app/widget/event_card.dart';
import 'package:event_app/widget/image_picker_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                  clipBehavior: Clip.hardEdge,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 0),
                  width: double.infinity,
                  decoration: _containerDecoration(),
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    children: [_buildForm()],
                  )))
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

  _titleStyle() {
    return TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  }

  _padding({double bottom = 10}) {
    return Padding(padding: EdgeInsets.only(bottom: bottom));
  }

  _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Title',
          style: _titleStyle(),
        ),
        _padding(),
        Text('Road trip...'),
        _padding(bottom: 30),
        Text(
          'Date & Time',
          style: _titleStyle(),
        ),
        _padding(),
        Text('Date picker'),
        _padding(bottom: 30),
        Text(
          'Background',
          style: _titleStyle(),
        ),
        _padding(),
        _buildPickerRow(),
        _padding(bottom: 30),
        Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: double.infinity,
              child: CupertinoButton(
                color: CupertinoColors.black,
                onPressed: () {},
                child: Text(
                  'Done',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ))
      ],
    );
  }

  _buildPickerRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ImagePickerCard(
            cardTitle: ImagePickerTitle.unsplash,
            imagePath: ImagePickerPath.unsplash),
        Text(
          'OR',
          textAlign: TextAlign.center,
        ),
        ImagePickerCard(
            cardTitle: ImagePickerTitle.gallery,
            imagePath: ImagePickerPath.gallery),
      ],
    );
  }
}
