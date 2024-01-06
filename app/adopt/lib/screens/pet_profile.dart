import 'package:adopt/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PetProfile extends StatelessWidget {
  final String animalId;

  const PetProfile({Key? key, required this.animalId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final animalRef =
    FirebaseFirestore.instance.collection('animal').doc(animalId);


    return StreamBuilder<DocumentSnapshot>(
      stream: animalRef.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data!.data() != null) {
          final data = snapshot.data!.data() as Map<String, dynamic>;

          if (data != null) {
            final animalName = data['name'];
            final animalDescription = data['description'];
            final animalGender = data['gender'];
            final animalSpecie = data['specie'];
            final animalBreed = data['breed'];
            final animalAdoptionFee = data['adoptionFee'];
            final animalMedicalHistory = data['medicalHistory'];
            final animalAge = data['age'];
            final animalShelterId = data['shelter'].id;

            return Scaffold(
              key: const Key('pet-profile'),
              appBar: ProfileAppBar(
                name: animalName,
                key: const Key('name'),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Carousel(
                      route: '/profile',
                      animalId: animalId,
                    ),
                    const SizedBox(height: 15,),
                    FavouriteButton(profileId: animalId),
                    Container(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Text(
                            'Specie: $animalSpecie',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Breed: $animalBreed',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Gender: $animalGender',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Age: $animalAge',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Description: $animalDescription',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Medical history: $animalMedicalHistory',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Adoption fee: $animalAdoptionFee€',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    ProfileInfo(shelterId: animalShelterId),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            );
          }
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
