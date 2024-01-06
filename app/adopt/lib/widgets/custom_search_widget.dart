import 'package:flutter/material.dart';

class CustomSearchWidget extends StatelessWidget {
  const CustomSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(30.0),
      child: TextFormField(
        cursorWidth: 0,
        enableInteractiveSelection: false,
        decoration: const InputDecoration(
          border: InputBorder.none,
          isDense: true,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 18, vertical: 18),
          hintText: 'Search',
        ),
      ),
    );
  }
}
