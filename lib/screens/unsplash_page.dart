import 'package:event_app/blocs/unsplash_bloc.dart';
import 'package:event_app/providers/unsplash_provider.dart';
import 'package:event_app/widget/image_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UnsplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return UnsplashState();
  }
}

class UnsplashState extends State<UnsplashPage> {
  @override
  Widget build(BuildContext context) {
    final bloc = UnsplashProvider.of(context);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
        child: Column(
          children: [
            Row(children: [
              Expanded(
                  child: Text(
                'Photos by Unsplash',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              )),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.close_outlined),
              )
              //todo onClick
            ]),
            _padding(10),
            _searchBar(bloc),
            Expanded(child: _buildCardList(bloc))
          ],
        ),
      ),
    );
  }

  _buildCardList(UnsplashBloc bloc) {
    return StreamBuilder(
        stream: bloc.urls,
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(
              child: CircularProgressIndicator(),
            );
          return ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                final url = snapshot.data[index];
                return Padding(
                  padding: EdgeInsets.only(bottom: 20.0),
                  child: ImageCard(imagePath: url),
                );
              });
        });
  }

  _padding(double padding) {
    return Padding(
      padding: EdgeInsets.only(bottom: padding),
    );
  }

  _searchBar(UnsplashBloc bloc) {
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
                    bloc.fetchPhotoBySearch(value);
                  },
                ),
              ))
            ],
          ),
        ));
  }
}
