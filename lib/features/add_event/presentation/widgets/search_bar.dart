import 'package:event_app/features/add_event/presentation/blocs/unsplash/unsplash_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          color: Colors.grey[300]),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          children: [
            Icon(Icons.search),
            Padding(padding: EdgeInsets.only(right: 4.0)),
            Expanded(
              child: Form(
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Search...', border: InputBorder.none),
                  onFieldSubmitted: (value) {
                    BlocProvider.of<UnsplashBloc>(context).add(
                      SearchImagesEvent(value),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
