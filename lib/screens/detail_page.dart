import 'package:event_app/models/event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final double _bigFont = 38;
  final EventModel eventModel;

  DetailPage({this.eventModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: NetworkImage(eventModel.imagePath),
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            )),
            child: Stack(
              children: [
                SizedBox.expand(
                  child: Container(
                    color: Color.fromRGBO(0, 0, 0, 0.5),
                  ),
                ),
                _buildPageBody(context, eventModel)
              ],
            )));
  }

  _buildPageBody(BuildContext context, EventModel eventModel) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.close_outlined, color: Colors.white),
              )
            ],
          ),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    _buildRow(
                        firstText: eventModel.monthRemaining.toString(),
                        secondText: "MONTHS"),
                    _buildPaddingBottom(20),
                    _buildRow(
                        firstText: eventModel.daysInterval.toString(),
                        secondText: "DAYS"),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('UNTIL', style: TextStyle(color: Colors.white)),
                    _buildPaddingBottom(20),
                    Text(
                      eventModel.name,
                      style: TextStyle(
                          fontSize: _bigFont,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _buildRow({String firstText, String secondText}) {
    return Row(
      children: [
        Expanded(
            flex: 3,
            child: Text(
              firstText,
              style: TextStyle(
                  fontSize: _bigFont,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )),
        Expanded(
            flex: 9,
            child: Text(
              secondText,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ))
      ],
    );
  }

  _buildPaddingBottom(double bottom) {
    return Padding(padding: EdgeInsets.only(bottom: bottom));
  }
}
