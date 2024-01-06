import 'package:adopt/screens/favourites.dart';
import 'package:flutter/cupertino.dart';
import 'package:adopt/screens/screens.dart';

Route onGenerate(RouteSettings settings) {
  return PageRouteBuilder(
      pageBuilder: (context, anim1, anim2) =>
          getRoute(settings.name.toString()));
}

Widget getRoute(String name, {String? animalId, String? shelterId}) {
  switch (name) {
    case '/feed':
      return Feed();
    case '/profile':
      return animalId != null ? PetProfile(animalId: animalId) : Feed();
    case '/shelter':
      return shelterId != null ? Shelter(shelterId: shelterId) : Feed();
    case '/create_profile':
      return shelterId != null
          ? CreateAnimalScreen(shelterId: shelterId)
          : Feed();
    case '/favourites':
      return Favourites();
    case '/login_screen':
      return const LoginPage();
    default:
      return Feed();
  }
}
