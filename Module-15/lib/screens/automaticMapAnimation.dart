import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AutomaticMapAnimation extends StatefulWidget {
  const AutomaticMapAnimation({super.key});
  @override
  State<AutomaticMapAnimation> createState() => _AutomaticMapAnimationState();
}

class _AutomaticMapAnimationState extends State<AutomaticMapAnimation> {
  late GoogleMapController googleMapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google map screen'),
      ),
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          zoom: 15,
          bearing: 30,
          tilt: 10,
          target: LatLng(24.250151813382207, 89.92231210838047),
        ),
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        zoomControlsEnabled: true,
        zoomGesturesEnabled: true,
        trafficEnabled: false,
        onMapCreated: (GoogleMapController controller) {
          print('on map created');
          googleMapController = controller;
        },
        compassEnabled: true,
        onTap: (LatLng l) {
          print(l);
        },
        // onLongPress: (LatLng l) {
        //   print(l);
        // },
        mapType: MapType.normal,
        markers: <Marker>{
          Marker(
              markerId: const MarkerId('custom-marker-1'),
              position: const LatLng(24.24504077379865, 89.9176350608468),
              icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
              infoWindow: const InfoWindow(title: 'Bazar'),
              draggable: false,
              // draggable: true,
              onDragStart: (LatLng latLng) {
                print(latLng);
              },
              onDragEnd: (LatLng latLng) {
                print(latLng);
              }
          ),
          Marker(
              markerId: const MarkerId('custom-marker-2'),
              position: const LatLng(24.244248692361154, 89.91651959717274),
              icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
              infoWindow: const InfoWindow(title: 'Bazar 2'),
              draggable: false,
              // draggable: true,
              onDragStart: (LatLng latLng) {
                print(latLng);
              },
              onDragEnd: (LatLng latLng) {
                print(latLng);
              }
          ),
        },
        polylines: <Polyline> {
          Polyline(polylineId: PolylineId('polyline'),
              color: Colors.pink,
              width: 20,
              jointType: JointType.round,
              onTap: (){
                print('Tapped on polyline');
              },
              points: const [
                LatLng(24.244248692361154, 89.91651959717274),
                LatLng(24.24504077379865, 89.9176350608468),
              ]),
        },
        // circles: <Circle> {
        //   Circle(
        //     circleId: CircleId('demo'),
        //     center: LatLng(24.10648361418759, 89.96545615056893),
        //     radius: 500,
        //     strokeColor: Colors.purple,
        //     strokeWidth: 4,
        //     fillColor: Colors.purple.shade100,
        //     onTap: () {
        //       print('Tapped on circle');
        //     }
        //   ),
        //   Circle(
        //     circleId: CircleId('demo-1'),
        //     center:  LatLng(24.109068980277137, 89.97399630377993),
        //     radius: 500,
        //     strokeColor: Colors.deepOrange,
        //     strokeWidth: 4,
        //     fillColor: Colors.deepOrange.shade100,
        //     onTap: () {
        //       print('Tapped on circle');
        //     }
        //   ),
        //   Circle(
        //     circleId: CircleId('demo-3'),
        //     center: LatLng(24.10152818327614, 89.96747317167907),
        //     radius: 500,
        //     strokeColor: Colors.blue,
        //     strokeWidth: 4,
        //     fillColor: Colors.blue.shade100,
        //     onTap: () {
        //       print('Tapped on circle');
        //     }
        //   ),
        // },
        // polygons: <Polygon> {
        //   Polygon(polygonId: PolygonId('poly-id'),
        //     fillColor: Colors.purple.shade400,
        //     strokeWidth: 0,
        //     onTap: () {
        //     },
        //     points: [
        //       LatLng(24.094457058310464, 89.97290196279874),
        //       LatLng(24.088521713190666, 89.97790160028127),
        //       LatLng(24.0858575745658, 89.98912396241529),
        //       LatLng(24.0796279753388, 89.98309435685475),
        //       LatLng(24.066861184161237, 89.9845824598033),
        //       LatLng(24.064235780991748, 89.97503379603725),
        //     ]
        //   )
        // },
      ),
    );
  }
}
