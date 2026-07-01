import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
  Future<Position> getCurrentLocation() async {
    final serviceEnabled =
    await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      throw Exception("Location service is disabled.");
    }

    LocationPermission permission =
    await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission =
      await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        throw Exception("Location permission denied.");
      }
    }

    if (permission ==
        LocationPermission.deniedForever) {
      throw Exception(
        "Location permission permanently denied.",
      );
    }

    return await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
      ),
    );
  }

  Future<String> getCityName(
      double latitude,
      double longitude,
      ) async {
    try {
      final places = await placemarkFromCoordinates(
        latitude,
        longitude,
      );

      if (places.isEmpty) {
        return "Unknown";
      }

      final place = places.first;

      return place.locality ??
          place.subAdministrativeArea ??
          place.administrativeArea ??
          place.country ??
          "Unknown";
    } catch (e) {
      return "Unknown";
    }
  }
}