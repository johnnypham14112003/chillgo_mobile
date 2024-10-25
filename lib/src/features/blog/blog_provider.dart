import 'package:chillgo_mobile/src/data/repositories/location_repository.dart';
import 'package:chillgo_mobile/src/models/location.dart';
import 'package:flutter/material.dart';

class BlogProvider extends ChangeNotifier {
  Location? get firstLocation => _firstLocation;
  Location? _firstLocation;

  List<Location> get otherLocations => _otherLocations;
  List<Location> _otherLocations = [];

  BlogProvider() {
    init();
  }
  init() async {
    final locations = await LocationRepository().getAllLocation();
    _firstLocation = locations.first;
    _otherLocations = locations.sublist(1, locations.length);
    notifyListeners();
  }
}
