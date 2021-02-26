import 'package:event_app/core/enums/routes.dart';
import 'package:event_app/core/models/event_model.dart';
import 'package:event_app/core/presentation/widgets/event_card.dart';
import 'package:event_app/features/home/presentation/blocs/event_list/event_list_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  final today = new DateFormat.yMMMMEEEEd().format(DateTime.now());

  @override
  Widget build(BuildContext context) {
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
            Expanded(
              child: BlocBuilder<EventListBloc, EventListState>(
                builder: (context, state) {
                  if (state is EventListLoaded) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemCount: state.events.length,
                      itemBuilder: (context, index) {
                        final event = state.events[index];
                        return _tappableCard(context, event);
                      },
                    );
                  }
                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tappableCard(BuildContext context, EventModel eventModel) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, RoutesName.detailPage,
              arguments: eventModel);
        },
        child: EventCard(eventModel: eventModel),
      ),
    );
  }
}
