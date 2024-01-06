import 'package:flutter/material.dart';

class CreateFavouritesButton extends StatelessWidget {
  const CreateFavouritesButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 25),
      alignment: Alignment.bottomLeft,
      child: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/favourites');
        },
        backgroundColor: const Color(0xFF79513A),
        child: const Icon(Icons.favorite),
      ),
    );
  }
}
