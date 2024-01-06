import 'package:flutter/material.dart';

class CreateProfileButton extends StatelessWidget {
  const CreateProfileButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      alignment: Alignment.bottomRight,
      child: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/create_profile');
        },
        backgroundColor: const Color(0xFF79513A),
        child: const Icon(Icons.add),
      ),
    );
  }
}
