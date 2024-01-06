import 'package:flutter/material.dart';
import 'widgets.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String name;

  const ProfileAppBar({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).primaryColor,
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
          height: 90,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              name, // GIVEN ANIMAL NAME
              style: const TextStyle(
                fontFamily: 'Source Sans Pro',
                fontSize: 46,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(90);
}
