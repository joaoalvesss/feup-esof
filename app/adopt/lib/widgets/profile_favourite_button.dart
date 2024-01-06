import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavouriteButton extends StatefulWidget {
  final String profileId;

  const FavouriteButton({Key? key, required this.profileId}) : super(key: key);

  @override
  State<FavouriteButton> createState() => _FavouriteButtonState();
}

class _FavouriteButtonState extends State<FavouriteButton> {
  Future<SharedPreferences>? _prefsFuture;
  bool _isLiked = false;

  @override
  void initState() {
    super.initState();
    _prefsFuture = SharedPreferences.getInstance();
    /*final prefs = await _prefsFuture;
    SharedPreferences.getInstance().then((prefs) {
      List<String> favoriteAnimalIds = _prefs.getStringList('favorite_animals') ?? [];
      setState(() {
        if (favoriteAnimalIds.contains(widget.profileId)) {
          _isLiked = true;
        }
        else {
          _isLiked = false;
        }
      });
    });*/
  }

  Future<bool> _onLikeButtonTapped(bool isLiked) async {
    setState(() {
      _isLiked = !isLiked;
    });
    final _prefs = await _prefsFuture;
    List<String> favoriteAnimalIds = _prefs?.getStringList('favorite_animals') ?? [];
    if (_isLiked) {
      favoriteAnimalIds.add(widget.profileId);
    } else {
      favoriteAnimalIds.remove(widget.profileId);
    }
    _prefs?.setStringList('favorite_animals', favoriteAnimalIds);
    return !isLiked;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      future: _prefsFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final prefs = snapshot.data!;
          final favoriteAnimalIds = prefs.getStringList('favorite_animals') ?? [];
          _isLiked = favoriteAnimalIds.contains(widget.profileId);
          return LikeButton(
            onTap: _onLikeButtonTapped,
            isLiked: _isLiked,
            size: 30.0,
            circleColor: const CircleColor(start: Color(0xff78523D), end: Color(0xffA00000)),
            bubblesColor: const BubblesColor(
              dotPrimaryColor: Color(0xff78523D),
              dotSecondaryColor: Color(0xffA00000),
            ),
            likeBuilder: (bool isLiked) {
              return Icon(
                Icons.favorite,
                color: isLiked ? const Color(0xff78523D) : const Color(0xffC0C0C0),
                size: 30.0,
              );
            },
            countBuilder: (int? count, bool isLiked, String text) {
              var color = isLiked ? const Color(0xff78523D) : const Color(0xffC0C0C0);
              Widget? result;
              if (count == 0) {
                result = Text(
                  "favorite",
                  style: TextStyle(color: color),
                );
              } else {
                result = GestureDetector(
                  child: Text(
                    text,
                    style: TextStyle(color: color),
                  ),
                  onTap: () {},
                );
              }
              return result;
            },
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
 /* Widget build(BuildContext context) {
    return LikeButton(
      onTap: _onLikeButtonTapped,
      isLiked: _isLiked,
      size: 30.0,
      circleColor:
      const CircleColor(start: Color(0xff78523D), end: Color(0xffA00000)),
      bubblesColor: const BubblesColor(
        dotPrimaryColor: Color(0xff78523D),
        dotSecondaryColor: Color(0xffA00000),
      ),
      likeBuilder: (bool isLiked) {
        return Icon(
          Icons.favorite,
          color: isLiked ? const Color(0xff78523D) : const Color(0xffC0C0C0),
          size: 30.0,
        );
      },
      countBuilder: (int? count, bool isLiked, String text) {
        var color = isLiked ? const Color(0xff78523D) : const Color(0xffC0C0C0);
        Widget? result;
        if (count == 0) {
          result = Text(
            "favorite",
            style: TextStyle(color: color),
          );
        } else {
          result = GestureDetector(
            child: Text(
              text,
              style: TextStyle(color: color),
            ),
            onTap: () {},
          );
        }
        return result;
      },
    );
  }
}
*/