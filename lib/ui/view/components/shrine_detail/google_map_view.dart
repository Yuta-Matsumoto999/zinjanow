import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapView extends StatefulWidget {
  final double? lat;
  final double? lng;
  
  const GoogleMapView({
    Key? key,
    this.lat,
    this.lng
  }) :super(key: key);

  CameraPosition _setCameraPosition() {
    return CameraPosition(
      bearing: 192.8334901395799,
      zoom: 14.0,
      target: LatLng(lat!, lng!)
    );
  }

  Set<Marker> _createMarker() {
    return {
      Marker(
        markerId: const MarkerId("shrine"),
        position: LatLng(lat!, lng!)
      )
    };
  }

  @override
  State<GoogleMapView> createState() => _GoogleMapViewState();
}

class _GoogleMapViewState extends State<GoogleMapView> {
  late GoogleMapController mapController;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      width: size.width,
      height: size.height * 0.3,
      child: GoogleMap(
        initialCameraPosition: widget._setCameraPosition(),
        markers: widget._createMarker(),
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        mapType: MapType.normal,
        zoomGesturesEnabled: true,
        zoomControlsEnabled: true,
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
        },
        gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
          Factory<OneSequenceGestureRecognizer>(
            () => EagerGestureRecognizer(),
          ),
        },
      ),
    );
  }
}