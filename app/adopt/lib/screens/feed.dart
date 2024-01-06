import 'package:adopt/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../widgets/favourites_button.dart';

class Feed extends StatelessWidget {
  const Feed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
          // CreateFavouritesButton(),
          CreateLoginButton(),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('shelter').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final shelters = snapshot.data!.docs;
            return ListView.builder(
              key: const Key('/feed'),
              itemCount: shelters.length,
              itemBuilder: (context, index) {
                final shelterId = shelters[index].id;
                return Column(
                  children: [
                    ShelterCarousel(
                      route: '/shelter',
                      shelterId: shelterId,
                      key: Key('shelter-$index'),
                    ),
                    ExpandCollapse(shelterId: shelterId),
                  ],
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
