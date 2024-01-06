import 'package:flutter/material.dart';
import 'package:adopt/app/routing.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'dart:io';
import 'package:flutter/services.dart';

class Carousel extends StatefulWidget {
  final String route;
  final String animalId;
  final String shelterId;

  const Carousel({
    Key? key,
    this.route = '/feed',
    this.animalId = '0',
    this.shelterId = '0',
  }) : super(key: key);

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  List<String> _images = [];

  @override
  void initState() {
    super.initState();
    fetchCarouselData();
  }

  Future<void> fetchCarouselData() async {
    if (widget.route == '/shelter') {
      await fetchAnimalCarouselData();
    }
    else if (widget.route == '/profile') {
      await fetchAnimalProfileCarouselData();
    }
    else {
      await fetchShelterCarouselData();
    }
  }

  Future<void> fetchShelterCarouselData() async {
    final animalQuerySnapshot = await FirebaseFirestore.instance
        .collection('animal')
        .where('shelter', isEqualTo: 'shelter/${widget.shelterId}')
        .get();

    final animalImageUrls = animalQuerySnapshot.docs.map((doc) {
      final animalData = doc.data();
      return animalData['imageUrls'] as String;
    }).toList();

    setState(() {
      _images = animalImageUrls;
    });
  }

  Future<void> fetchAnimalCarouselData() async {
    final animalRef =
    FirebaseFirestore.instance.collection('animal').doc(widget.animalId);

    final snapshot = await animalRef.get();
    if (snapshot.exists) {
      final data = snapshot.data() as Map<String, dynamic>;
      final List<String> imageUrls =
      (data['imageUrls'] as List<dynamic>).cast<String>();

      setState(() {
        _images = imageUrls;
      });
    }
  }

  Future<void> fetchAnimalProfileCarouselData() async {
    final animalRef =
    FirebaseFirestore.instance.collection('animal').doc(widget.animalId);

    final snapshot = await animalRef.get();
    if (snapshot.exists) {
      final data = snapshot.data() as Map<String, dynamic>;
      final List<String> imageUrls =
      (data['imageUrls'] as List<dynamic>).cast<String>();

      setState(() {
        _images = imageUrls;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context, rootNavigator: true).push(
              MaterialPageRoute(
                builder: (context) => getRoute(
                  widget.route,
                  animalId: widget.animalId,
                  shelterId: widget.shelterId,
                ),
              ),
            );
          },
          child: CarouselSlider(
            items: _images.map((image) {
              return Builder(
                builder: (BuildContext context) {
                  return Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 60,
                        margin: const EdgeInsets.only(
                            right: 2.5, left: 2.5, top: 15.0),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          image: DecorationImage(
                            image: Image.file(File(image)).image,
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        bottom: 0,
                        width: MediaQuery.of(context).size.width / 2 - 160,
                        child: const Center(
                          child: Icon(
                            Icons.arrow_back_ios_rounded,
                            color: Colors.white,
                            size: 30,
                            shadows: <Shadow>[
                              Shadow(
                                blurRadius: 5.0,
                                color: Color.fromARGB(255, 82, 82, 82),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        bottom: 0,
                        width: MediaQuery.of(context).size.width / 2 - 150,
                        child: const Center(
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.white,
                            size: 30,
                            shadows: <Shadow>[
                              Shadow(
                                blurRadius: 5.0,
                                color: Color.fromARGB(255, 82, 82, 82),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            }).toList(),
            options: CarouselOptions(
              autoPlay: false,
              enableInfiniteScroll: true,
              viewportFraction: 1,
              enlargeCenterPage: true,
              aspectRatio: 16 / 8,
              onPageChanged: (index, reason) {
                setState(() {});
              },
            ),
          ),
        )
      ],
    );
  }
}