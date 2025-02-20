import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPreview extends StatefulWidget {
  const MapPreview({super.key});

  @override
  _EventMapState createState() => _EventMapState();
}

class _EventMapState extends State<MapPreview> {
  late GoogleMapController _mapController;

  final LatLng eventLocation =
      const LatLng(37.7749, -122.4194); // Example event location
  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    // Add initial marker
    _addEventMarker();
  }

  @override
void dispose() {
  _mapController.dispose();
  super.dispose();
}

  void _addEventMarker() {
    setState(() {
      _markers.add(
        Marker(
          markerId: const MarkerId('event_marker'),
          position: eventLocation,
          infoWindow: const InfoWindow(
            title: 'Event Location',
            snippet: 'Join us here for the event!',
          ),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 20,
        children: [
          const Text(
            'Location',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Stack(
              children: [
                SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: GoogleMap(
                    onMapCreated: (GoogleMapController controller) {
                      _mapController = controller;
                    },
                    markers: _markers,
                    initialCameraPosition: CameraPosition(
                      target: eventLocation,
                      zoom: 14.0,
                    ),
                    
                    key: UniqueKey(),
                  ),
                ),
                Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.black.withOpacity(0.7),
                  child: const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Kumasi, Twin Towers',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                        Text(
                          '28 may Street 41, Baku Aznonial',
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
