import 'package:chillgo_mobile/src/data/repositories/location_repository.dart';
import 'package:chillgo_mobile/src/models/location.dart';
import 'package:flutter/material.dart';

class LocationProvider extends ChangeNotifier {
  final _repository = LocationRepository();
  List<Location> _locations = [];
  List<Location> get locations => _locations;

  List<Location> _topLocations = [];
  List<Location> get topLocations => _topLocations;

  List<Location> _randomLocations = [];
  List<Location> get randomLocations => _randomLocations;

  //get location khi class đc khởi tạo
  LocationProvider() {
    _init();
  }

  _init() {
    getTopLocation();
    getRandomLocation();
    notifyListeners();
  }

  Future<void> getAllLocation() async {
    _locations = await _repository.getAllLocation();
    notifyListeners();
  }

  Future<void> getTopLocation() async {
    _topLocations = await _repository.getTopLocation();
  }

  Future<void> getRandomLocation() async {
    _topLocations = await _repository.getRandomLocation();
  }
}
