import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationModel {
  final String id;
  final String name;
  final LatLng latLng;

  LocationModel({required this.id, required this.name, required this.latLng});
}

List<LocationModel> markerlocation = [
  LocationModel(
    id: "1",
    name: "جامعه Mti",
    latLng: LatLng(29.99325876683932, 31.3111846216088),
  ),
  LocationModel(
    id: "2",
    name: "جامعه Mti ",
    latLng: LatLng(29.996989686556052, 31.31841076642496),
  ),
  LocationModel(
    id: "3",
    name: "جامعه Mti",
    latLng: LatLng(29.99553041627606, 31.31868728367287),
  ),
  LocationModel(
    id: "4",
    name: "جامعه Mti",
    latLng: LatLng(29.99333360362932, 31.31242925060575),
  ),
];
