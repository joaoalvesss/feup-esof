import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ExpandCollapse extends StatefulWidget {
  final String shelterId;
  const ExpandCollapse({Key? key, required this.shelterId}) : super(key: key);

  @override
  State<ExpandCollapse> createState() => _ExpandCollapseState();
}

class _ExpandCollapseState extends State<ExpandCollapse> {
  @override
  @override
  Widget build(BuildContext context) {
    final animalRef =
        FirebaseFirestore.instance.collection('shelter').doc(widget.shelterId);
    return StreamBuilder<DocumentSnapshot>(
      stream: animalRef.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show a loading indicator while waiting for data
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          // Show an error message if there was an error retrieving the data
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData) {
          // Show a message if there is no data
          return const Text('No data found.');
        } else {
          final data = snapshot.data!.data() as Map<String, dynamic>;
          final shelterName = data['name'];
          final shelterRating = data['rating'];
          return Column(
            children: <Widget>[
              ExpansionTile(
                tilePadding: const EdgeInsets.only(right: 48, left: 48),
                childrenPadding: const EdgeInsets.only(right: 32, left: 32),
                shape: InputBorder.none,
                title: Text(
                  shelterName,
                  style: const TextStyle(fontSize: 20),
                ),
                subtitle: RatingBarIndicator(
                  rating: shelterRating.toDouble(),
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 25.0,
                  direction: Axis.horizontal,
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
