import 'package:adopt/screens/shelter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:adopt/widgets/widgets.dart';
import 'package:adopt/screens/feed.dart';

class CustomScrollingShelter extends StatelessWidget {
  final String shelterId;

  const CustomScrollingShelter({Key? key, required this.shelterId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shelterRef =
        FirebaseFirestore.instance.collection('shelter').doc(shelterId);

    return StreamBuilder<DocumentSnapshot>(
      stream: shelterRef.snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data!.data() == null) {
          return CircularProgressIndicator();
        }

        final shelterData = snapshot.data!.data() as Map<String, dynamic>;
        final shelterName = shelterData['name'];
        final shelterAddress = shelterData['adress'];
        final shelterEmail = shelterData['email'];
        final shelterPhone = shelterData['phone'];

        return GestureDetector(
          onVerticalDragUpdate: (details) {
            if (details.delta.dy > 50) {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => Feed()));
            }
          },
          child: Material(
            child: SizedBox(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextElement(
                          text: shelterName,
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(height: 8.0),
                        TextElement(text: shelterAddress),
                        SizedBox(height: 4.0),
                        TextElement(text: shelterPhone.toString()),
                        SizedBox(height: 4.0),
                        TextElement(text: shelterEmail),
                      ],
                    ),
                  ),
                  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('animal')
                        .where('shelter', isEqualTo: shelterRef)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                        return Center(child: Text('No animals found.'));
                      }
                      final animalDocs = snapshot.data!.docs;
                      final animalIds =
                          animalDocs.map((doc) => doc.id).toList();

                      return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: animalIds.length,
                        itemBuilder: (context, index) {
                          final animalId = animalIds[index];

                          return Carousel(
                            key: Key('animal-$index'),
                            route: '/profile',
                            animalId: animalId,
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
