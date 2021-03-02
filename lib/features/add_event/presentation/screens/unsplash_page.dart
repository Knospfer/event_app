import 'package:event_app/features/add_event/presentation/blocs/unsplash/unsplash_bloc.dart';
import 'package:event_app/features/add_event/presentation/widgets/card_list.dart';
import 'package:event_app/features/add_event/presentation/widgets/search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UnsplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return UnsplashState();
  }
}

class UnsplashState extends State<UnsplashPage> {
  @override
  void didChangeDependencies() {
    BlocProvider.of<UnsplashBloc>(context).add(FetchRandomImagesEvent());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Photos by Unsplash',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.close_outlined),
                )
              ],
            ),
            Padding(padding: EdgeInsets.only(bottom: 10)),
            SearchBar(),
            Expanded(child: CardList())
          ],
        ),
      ),
    );
  }
}
