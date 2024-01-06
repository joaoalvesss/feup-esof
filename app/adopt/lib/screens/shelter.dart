import 'package:flutter/material.dart';
import 'package:adopt/widgets/widgets.dart';

class Shelter extends StatefulWidget {
  final String shelterId;
  const Shelter({Key? key, required this.shelterId}) : super(key: key);

  @override
  _ShelterState createState() => _ShelterState();
}

class _ShelterState extends State<Shelter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: CustomScrollingShelter(
        key: const Key('shelterpage'),
        shelterId: widget.shelterId,
      ),
    );
  }
}
