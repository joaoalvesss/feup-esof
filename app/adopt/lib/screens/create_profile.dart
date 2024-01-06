import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:math';

class CreateAnimalScreen extends StatefulWidget {
  final String shelterId;

  const CreateAnimalScreen({Key? key, required this.shelterId})
      : super(key: key);

  @override
  State<CreateAnimalScreen> createState() => _CreateAnimalScreenState();
}

class _CreateAnimalScreenState extends State<CreateAnimalScreen> {
  final controllerName = TextEditingController();
  final controllerAge = TextEditingController();
  final controllerSpecie = TextEditingController();
  final controllerBreed = TextEditingController();
  final controllerGender = TextEditingController();
  final controllerDescription = TextEditingController();
  final controllerMedical = TextEditingController();
  List<String> _imageUrls = [];

  InputDecoration decoration(String label) => InputDecoration(
    labelText: label,
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: Color(0xFF79513A), width: 2.0)),
  );

  Future createAnimal(Animal animal, String animalId) async {
    final collection = FirebaseFirestore.instance.collection('animal');
    final docAnimal = collection.doc(animalId);
    final json = animal.toJson();
    await docAnimal.set(json);

    final docSnapshot = await docAnimal.get();
    final data = docSnapshot.data();
    print(data!['imageUrls']);
  }

  Future<List<String>> _uploadImages() async {
    List<String> uploadedUrls = [];
    try {
      final List<XFile> images = await ImagePicker().pickMultiImage(imageQuality: 100);
      if (images.isNotEmpty) {
        for (int i = 0; i < images.length; i++) {
          uploadedUrls.add(images[i].path);
        }
      }
    } on PlatformException catch (e) {
      print('Error: $e');
    }
    _imageUrls = uploadedUrls;
    return uploadedUrls;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('create-animal-screen'),
      appBar: AppBar(
        title: const Text(
          'Create Animal Profile',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Source Sans Pro',
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        toolbarHeight: 70,
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Image.asset(
              'assets/images/Logo.png',
              height: 60,
              width: 60,
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          const SizedBox(height: 10),
          TextField(
            controller: controllerName,
            decoration: decoration('Name'),
          ),
          const SizedBox(height: 24),
          TextField(
            controller: controllerAge,
            decoration: decoration('Age'),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 24),
          TextField(
            controller: controllerSpecie,
            decoration: decoration('Species'),
          ),
          const SizedBox(height: 24),
          TextField(
            controller: controllerBreed,
            decoration: decoration('Breed'),
          ),
          const SizedBox(height: 24),
          TextField(
            controller: controllerGender,
            decoration: decoration('Gender'),
          ),
          const SizedBox(height: 24),
          TextField(
            controller: controllerDescription,
            decoration: decoration('Description'),
          ),
          const SizedBox(height: 24),
          TextField(
            controller: controllerMedical,
            decoration: decoration('Medical History'),
          ),
          const SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(left: 5),
                child: const Text(
                  'Upload up to 5 images:',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Source Sans Pro',
                    color: Colors.black54,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: _uploadImages,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF79513A),
                  textStyle: const TextStyle(fontSize: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
                child: const Text('Upload'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          if (_imageUrls.isNotEmpty)
            Wrap(
              spacing: 8,
              children: [
                for (final imageUrl in _imageUrls)
                  Image.network(
                    imageUrl,
                    height: 100,
                    width: 100,
                  ),
                if (_imageUrls.length < 5)
                  IconButton(
                    icon: const Icon(Icons.add_a_photo),
                    onPressed: _uploadImages,
                  ),
              ].map((e) => Container(child: e)).toList(),
            ),
          SizedBox(
              height: 40,
              width: 200,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF79513A),
                    textStyle: const TextStyle(fontSize: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                  child: const Text('Create'),
                  onPressed: () {
                    final adoptionFee = Random().nextInt(51) + 50;
                    final animal = Animal(
                      name: controllerName.text,
                      age: int.parse(controllerAge.text),
                      specie: controllerSpecie.text,
                      breed: controllerBreed.text,
                      gender: controllerGender.text,
                      description: controllerDescription.text,
                      medicalHistory: controllerMedical.text,
                      adoptionFee: adoptionFee,
                      imageUrls: _imageUrls,
                      shelter: FirebaseFirestore.instance
                          .collection('shelter')
                          .doc(widget.shelterId),
                    );
                    final animalId = Animal.generateRandomId();
                    createAnimal(animal, animalId);
                    Navigator.pop(context);
                  })),
        ],
      ),
    );
  }
}

class Animal {
  final String name;
  final int age;
  final String specie;
  final String breed;
  final String gender;
  final String description;
  final String medicalHistory;
  final int adoptionFee;
  final List<String> imageUrls;
  final DocumentReference shelter;

  Animal({
    required this.name,
    required this.age,
    required this.specie,
    required this.breed,
    required this.gender,
    required this.description,
    required this.medicalHistory,
    required this.adoptionFee,
    required this.imageUrls,
    required this.shelter,
  });

  Map<String, dynamic> toJson() => {
    'name': name,
    'age': age,
    'breed': breed,
    'specie': specie,
    'gender': gender,
    'description': description,
    'medicalHistory': medicalHistory,
    'adoptionFee': adoptionFee,
    'imageUrls': imageUrls,
    'shelter': shelter,
  };

  static String generateRandomId() {
    return FirebaseFirestore.instance.collection('animal').doc().id;
  }
}