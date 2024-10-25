import 'dart:developer';

import 'package:chillgo_mobile/src/data/api_client.dart';
import 'package:chillgo_mobile/src/models/location.dart';

class LocationRepository {
  //singleton
  static final LocationRepository _instance = LocationRepository._();
  factory LocationRepository() {
    return _instance;
  }
  LocationRepository._();

  final path = 'locations';

  Future getLocationById() async {}
  Future<List<Location>> getAllLocation() async {
    try {
      final response = await apiClient.get('$path/AllLocations');
      final locations = (response as List)
          .map((element) => Location.fromJson(element))
          .toList();
      return locations;
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  Future<List<Location>> getTopLocation() async {
    try {
      final response = await apiClient.get('$path/Top5');
      final locations = (response as List)
          .map((element) => Location.fromJson(element))
          .toList();
      return locations;
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  Future<List<Location>> getRandomLocation() async {
    try {
      final response = await apiClient.get('$path/Random5Location');
      final locations = (response as List)
          .map((element) => Location.fromJson(element))
          .toList();
      return locations;
    } catch (e) {
      log(e.toString());
      return [];
    }
  }
}
