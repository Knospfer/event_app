import 'package:event_app/features/add_event/presentation/blocs/unsplash/unsplash_bloc.dart';
import 'package:event_app/features/add_event/presentation/widgets/image_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UnsplashBloc, UnsplashState>(
      builder: (context, state) {
        if (state is UnsplashLoaded) {
          return ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: state.imageUrls.length,
            itemBuilder: (context, index) {
              final url = state.imageUrls[index];
              return Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context, url);
                  },
                  child: ImageCard(imagePath: url),
                ),
              );
            },
          );
        }
        if (state is UnsplashError) {
          return Center(
            child: Text(
              'Network Error! D:',
              style: TextStyle(fontSize: 30.0),
            ),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
