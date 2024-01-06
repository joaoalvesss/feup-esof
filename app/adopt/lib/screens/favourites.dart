import 'package:flutter/material.dart';
import 'package:adopt/widgets/widgets.dart';

import '../widgets/custom_scrolling_favourites_widget.dart';

class Favourites extends StatefulWidget {
  const Favourites({Key? key}) : super(key: key);

  @override
  _FavouritesState createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: CustomScrollingFavourites(),
    );
  }
}
