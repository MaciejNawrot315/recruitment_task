import 'package:flutter/material.dart';
import 'package:recruitment_task/picture.dart';

class FavImagesModel extends ChangeNotifier {
  List<Picture> _favPictures = [];

  List<Picture> get pictures => _favPictures;

  void add(Picture picture) {
    _favPictures.add(picture);
    notifyListeners();
  }

  void remove(Picture picture) {
    _favPictures.remove(picture);
    notifyListeners();
  }
}
