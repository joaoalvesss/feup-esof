import 'package:flutter/material.dart';
import 'widgets.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).primaryColor,
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
          height: 90,
          child: Row(
            children: [
              const SizedBox(
                width: 250,
                child: Expanded(
                  child: CustomSearchWidget(),
                ),
              ),
              const SizedBox(
                width: 3,
              ),
              Expanded(child: CustomDropdownButton())
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(90);
}
