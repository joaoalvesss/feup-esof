import 'package:adopt/screens/feed.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomScrollingFavourites extends StatefulWidget {
  @override
  _CustomScrollingFavouritesState createState() => _CustomScrollingFavouritesState();
}

class _CustomScrollingFavouritesState extends State<CustomScrollingFavourites> {
  Future<SharedPreferences>? _prefsFuture;
  List<String> _favoriteAnimalIds = [];
  List<DocumentSnapshot> _favoriteAnimalSnapshots = [];

  @override
  void initState() {
    super.initState();
    _prefsFuture = SharedPreferences.getInstance();
    _loadFavoriteAnimals();
  }

  Future<void> _loadFavoriteAnimals() async {
    final prefs = await _prefsFuture;
    setState(() {
      _favoriteAnimalIds = prefs?.getStringList('favorite_animals') ?? [];
    });
    for (String animalId in _favoriteAnimalIds) {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection('animal').doc(animalId).get();
      setState(() {
        _favoriteAnimalSnapshots.add(snapshot);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _favoriteAnimalSnapshots.length,
        itemBuilder: (BuildContext context, int index) {
          DocumentSnapshot snapshot = _favoriteAnimalSnapshots[index];
          return ListTile(
            leading: Image.network(snapshot['image_url']),
            title: Text(snapshot['name']),
            subtitle: Text(snapshot['description']),
          );
        },
      ),
    );
  /*
    return StreamBuilder<DocumentSnapshot>(
      stream: _favoriteAnimalSnapshots.snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data!.data() == null) {
          return CircularProgressIndicator();
        }

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
                  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('animal')
                        .where('animalId', whereIn: _favoriteAnimalIds)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                        return Center(child: Text('No animals found.'));
                      }
                      final animalDocs = snapshot.data!.docs;
                      final animalIds = animalDocs.map((doc) => doc.id).toList();

                      return Column(
                        children: animalIds
                            .map((animalId) => Carousel(
                          route: '/profile',
                          animalId: animalId,
                        ))
                            .toList(),
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
*/
  }
}