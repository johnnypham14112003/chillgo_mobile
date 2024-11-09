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

  Location? get detailLocation => _detailLocation;
  Location? _detailLocation;

  //get location khi class đc khởi tạo
  LocationProvider() {
    init();
  }

  init() async {
    await getTopLocation();
    await getRandomLocation();
    notifyListeners();
  }

  Future<void> getAllLocation() async {
    _locations = await _repository.getAllLocation();
    notifyListeners();

    final futures = _locations.map((location) async {
      final image = await _repository.getImage(location.id);
      location.images = [image];
      return location;
    });
    await Future.wait(futures);

    notifyListeners();
  }

  Future<void> getTopLocation([bool isNotify = false]) async {
    _topLocations = await _repository.getTopLocation();

    if (isNotify) {
      notifyListeners();
    }
  }

  Future<void> getRandomLocation() async {
    _randomLocations = await _repository.getRandomLocation();
  }

  Future<void> getLocationById(String id) async {
    _detailLocation = null;
    notifyListeners();

    _detailLocation = await _repository.getLocationById(id);
    notifyListeners();
  }
}
