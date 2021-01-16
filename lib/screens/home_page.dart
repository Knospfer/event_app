import 'package:event_app/models/event.dart';
import 'package:event_app/providers/event_provider.dart';
import 'package:event_app/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../widget/event_card.dart';

class HomePage extends StatelessWidget {
  final today = new DateFormat.yMMMMEEEEd().format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    final eventBloc = EventProvider.of(context);
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.fromLTRB(20, 60, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            today.toUpperCase(),
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
          StreamBuilder(
              stream: eventBloc.events,
              builder: (context, AsyncSnapshot<List<EventModel>> snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: Text("There's no event yet!"));
                }
                return ListView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      final event = snapshot.data[index];
                      return _tappableCard(context, event);
                    });
              })
        ],
      ),
    ));
  }

  Widget _tappableCard(BuildContext context, EventModel eventModel) {
    return Padding(
        padding: EdgeInsets.only(bottom: 30),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, RoutesName.detailPage);
          },
          child: EventCard(eventModel: eventModel),
        ));
  }
}
