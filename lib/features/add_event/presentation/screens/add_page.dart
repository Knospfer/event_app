import 'package:event_app/core/models/event_model.dart';
import 'package:event_app/core/presentation/widgets/event_card.dart';
import 'package:event_app/dipendency_injection.dart';
import 'package:event_app/features/add_event/presentation/blocs/add_event_bloc.dart';
import 'package:event_app/features/add_event/presentation/blocs/unsplash/unsplash_bloc.dart';
import 'package:event_app/features/add_event/presentation/screens/unsplash_page.dart';
import 'package:event_app/features/add_event/presentation/widgets/image_picker_card.dart';
import 'package:event_app/features/add_event/presentation/widgets/multi_platform_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AddState();
  }
}

class AddState extends State<AddPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  EventModel event = EventModel(
    eventDate: DateTime(DateTime.now().year, DateTime.now().month + 1, 12),
    currentDate: DateTime.now(),
    imagePath: 'https://picsum.photos/200/300',
    name: 'Road Trip',
  );

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddEventBloc, AddEventState>(
      listener: (context, state) {
        if (state is AddEventLoaded) {
          //TODO quando ci satà root page
          //Navigator.pop(context);
          _scaffoldKey.currentState
              .showSnackBar(SnackBar(content: Text('Event added!')));
        }
      },
      child: Scaffold(
        key: _scaffoldKey,
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
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.close_outlined),
                      )
                    ],
                  ),
                  _buildPaddedCard(),
                ],
              ),
            ),
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
                ),
              ),
            )
          ],
        ),
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

  _padding({double bottom = 12}) {
    return Padding(padding: EdgeInsets.only(bottom: bottom));
  }

  _buildForm() {
    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Title',
              style: _titleStyle(),
            ),
            _padding(),
            TextFormField(
              decoration: InputDecoration(hintText: 'Road trip..'),
              onFieldSubmitted: (value) {
                setState(() {
                  event.name = value;
                });
              },
              validator: (value) {
                if (value.isEmpty) return 'Please submit a title';
                return null;
              },
            ),
            _padding(bottom: 30),
            Text(
              'Date & Time',
              style: _titleStyle(),
            ),
            _padding(),
            MultiplatformPicker(
              onDataSubmitted: (DateTime dateSubmitted) {
                setState(() {
                  event.eventDate = dateSubmitted;
                });
              },
            ),
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
                    onPressed: () {
                      _validateForm(context);
                    },
                    child: Text(
                      'Done',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )),
            _padding(bottom: 30),
          ],
        ));
  }

  _buildPickerRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ImagePickerCard(
          cardTitle: ImagePickerTitle.unsplash,
          imagePath: ImagePickerPath.unsplash,
          onTap: () {
            _pushPageAndLoadSelection(context);
          },
        ),
        Text(
          'OR',
          textAlign: TextAlign.center,
        ),
        ImagePickerCard(
          cardTitle: ImagePickerTitle.gallery,
          imagePath: ImagePickerPath.gallery,
          onTap: () {
            _scaffoldKey.currentState
                .showSnackBar(SnackBar(content: Text('Coming soon')));
          },
        ),
      ],
    );
  }

  _pushPageAndLoadSelection(BuildContext context) async {
    final result =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return BlocProvider<UnsplashBloc>(
        create: (_) => getIt<UnsplashBloc>(),
        child: UnsplashPage(),
      );
    }));
    if (result != null) {
      setState(() {
        event.imagePath = result;
      });
    }
  }

  _validateForm(BuildContext context) {
    if (_formKey.currentState.validate()) {
      BlocProvider.of<AddEventBloc>(context).add(AddToCacheEvent(event));
    } else {
      _scaffoldKey.currentState
          .showSnackBar(SnackBar(content: Text('Insert an event name')));
    }
  }
}
