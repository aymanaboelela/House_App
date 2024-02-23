import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:house_app_one/Features/google_maps/data/models/locations_model.dart';
import 'package:location/location.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LocationView extends StatefulWidget {
  LocationView({super.key});

  @override
  State<LocationView> createState() => _LocationViewState();
}

class _LocationViewState extends State<LocationView> {
  late bool isLoding;
  late Location location;
  late PermissionStatus permissionStatus;
  GoogleMapController? googleMapController;
  Set<Marker> markers = {};
  CameraPosition _kLake = CameraPosition(
    bearing: 80.8334901395799,
    target: LatLng(29.993110476626523, 31.311015262253964),
    tilt: 59.440717697143555,
    zoom: 18.151926040649414,
  );

  @override
  void initState() {
    super.initState();
    isLoding = true;
    initMap();
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoding,
      child: Scaffold(
        body: GoogleMap(
          mapType: MapType.hybrid,
          markers: markers,
          zoomControlsEnabled: false,
          initialCameraPosition: _kLake,
          onMapCreated: (controller) {
            googleMapController = controller;
            // initMapStyle(); // chenge theme mode
          },
        ),
      ),
    );
  }

  void initMap() async {
    await Future.delayed(Duration(seconds: 3));
    initMarkars();
    isLoding = false;
    setState(() {});
  }

  void initMarkars() {
    var myMarkers = markerlocation
        .map(
          (LocationModel) => Marker(
            infoWindow: InfoWindow(title: LocationModel.name),
            position: LocationModel.latLng,
            markerId: MarkerId(LocationModel.id),
          ),
        )
        .toSet();
    markers.addAll(myMarkers);
    setState(() {});
  }

  // void initMapStyle() async {
  //   var nightMapStyle =
  //       await DefaultAssetBundle.of(context).loadString(AppStyle.nightmode);
  //   googleMapController!.setMapStyle(nightMapStyle);
  // }
}
