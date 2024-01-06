import 'package:adopt/app/routing.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ShelterCarousel extends StatefulWidget {
  final String route;
  final String animalId;
  final String shelterId;

  const ShelterCarousel({
    Key? key,
    this.route = '/feed',
    this.animalId = '0',
    this.shelterId = '0',
  }) : super(key: key);

  @override
  _ShelterCarouselState createState() => _ShelterCarouselState();
}

class _ShelterCarouselState extends State<ShelterCarousel> {
  final List<String> _images = [
    'assets/images/shelter1.jpg',
    'assets/images/shelter2.jpg',
    'assets/images/shelter3.jpg',
    'assets/images/shelter4.jpg',
    'assets/images/shelter5.jpg',
    'assets/images/shelter6.jpg',
    'assets/images/shelter7.jpg',
    'assets/images/shelter8.jpg',
    'assets/images/shelter9.jpg',
    'assets/images/shelter10.jpg',
    'assets/images/shelter11.jpg',
    'assets/images/shelter12.jpg',
    'assets/images/shelter13.jpg',
    'assets/images/shelter14.jpg',
    'assets/images/shelter15.jpg',
    'assets/images/shelter16.jpg',
    'assets/images/shelter17.jpg',
    'assets/images/shelter18.jpg',
    'assets/images/shelter19.jpg',
    'assets/images/shelter20.jpg',
    'assets/images/shelter21.jpg',
    'assets/images/shelter22.jpg',
    'assets/images/shelter23.jpg',
    'assets/images/shelter24.jpg',
    'assets/images/shelter25.jpg',
    'assets/images/shelter26.jpg',
    'assets/images/shelter27.jpg',
    'assets/images/shelter28.jpg',
    'assets/images/shelter29.jpg',
    'assets/images/shelter30.jpg',
    'assets/images/shelter31.jpg',
    'assets/images/shelter32.jpg',
    'assets/images/shelter33.jpg',
    'assets/images/shelter34.jpg',
    'assets/images/shelter35.jpg',
    'assets/images/shelter36.jpg',
    'assets/images/shelter37.jpg',
    'assets/images/shelter38.jpg',
    'assets/images/shelter39.jpg',
    'assets/images/shelter40.jpg',
    'assets/images/shelter41.jpg',
    'assets/images/shelter42.jpg',
  ];

  List<String> getCarouselImages() {
    final index = int.tryParse(widget.shelterId) ?? 0;
    if (index >= 0 && index < _images.length) {
      return _images.sublist(index * 2, index * 2 + 2);
    }
    return []; // Return a default list of images or handle the out-of-bounds case
  }

  @override
  Widget build(BuildContext context) {
    final carouselImages = getCarouselImages();

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
            items: carouselImages.map(
                  (image) {
                return Builder(
                  builder: (BuildContext context) {
                    return Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width - 60,
                          margin: const EdgeInsets.only(
                            right: 2.5,
                            left: 2.5,
                            top: 15.0,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            image: DecorationImage(
                              image: AssetImage(image),
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
              },
            ).toList(),
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
        ),
      ],
    );
  }
}
