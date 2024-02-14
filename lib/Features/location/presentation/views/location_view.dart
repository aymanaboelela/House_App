import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:house_app_one/Features/location/data/models/locations_model.dart';
import 'package:house_app_one/core/utils/assets.dart';
import 'package:house_app_one/core/utils/responsive.dart';

class LocationView extends StatefulWidget {
  LocationView({super.key});

  @override
  State<LocationView> createState() => _LocationViewState();
}

class _LocationViewState extends State<LocationView> {
  @override
  void initState() {
    initMarkars();

    super.initState();
  }

  CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(29.993110476626523, 31.311015262253964),
      tilt: 59.440717697143555,
      zoom: 17.151926040649414);

  late GoogleMapController googleMapController;
  Set<Marker> markers = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.hybrid,
            markers: markers,
            zoomControlsEnabled: false,
            initialCameraPosition: _kLake,
            onMapCreated: (controller) {
              googleMapController = controller;
              intMapStyle();
            },
          ),
          Positioned(
              bottom: 16,
              left: 12,
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.my_location_outlined,
                  size: SizeConfig.defaultSize! * 4,
                ),
                color: Colors.amber,
              ))
        ],
      ),
    );
  }

  void intMapStyle() async {
    var nighMapStle =
        await DefaultAssetBundle.of(context).loadString(AppStyle.nightmode);
    googleMapController.setMapStyle(nighMapStle);
  }

  void initMarkars() async {
    // var markerIcon = await BitmapDescriptor.fromAssetImage(
    //     ImageConfiguration(), AppAssets.help);
    var myMarkers = markerlocation
        .map(
          (LocationModel) => Marker(
            // icon: markerIcon,
            infoWindow: InfoWindow(title: LocationModel.name),
            position: LocationModel.latLng,
            markerId: MarkerId(LocationModel.id),
          ),
        )
        .toSet();
    markers.addAll(myMarkers);
    setState(() {});
  }
}
