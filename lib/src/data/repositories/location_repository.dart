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

  Future<Location?> getLocationById(String id) async {
    try {
      final response = await apiClient.get('$path/$id');
      final location = Location.fromJson(response);
      final image = await getImage(location.id);
      location.images = [image];
      return location;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<List<Location>> getAllLocation() async {
    try {
      final response = await apiClient.get('$path/all-locations');
      final locations = (response as List)
          .map((element) => Location.fromJson(element))
          .toList();
      return locations.sublist(0, 15);
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  Future<String> getImage(String name) async {
    try {
      final response = await apiClient.get('image/${name}_3');
      return response['image-url'];
    } on Exception catch (e) {
      return '';
    }
  }

  Future<List<Location>> getTopLocation() async {
    try {
      final response = await apiClient.get('$path/top-5');
      final locations = (response as List)
          .map((element) => Location.fromJson(element))
          .toList();
      final futures = locations.map((location) async {
        final image = await getImage(location.id);
        location.images = [image];
      });
      await Future.wait(futures);
      return locations;
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  Future<List<Location>> getRandomLocation() async {
    try {
      final response = await apiClient.get('$path/random-5-location');
      final locations = (response as List)
          .map((element) => Location.fromJson(element))
          .toList();
      final futures = locations.map((location) async {
        final image = await getImage(location.id);
        location.images = [image];
      });
      await Future.wait(futures);
      return locations;
    } catch (e) {
      log(e.toString());
      return [];
    }
  }
}
