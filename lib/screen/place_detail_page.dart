/*import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:my_veggielist_app/controller/place_detail_controller.dart';
import 'package:my_veggielist_app/controller/place_widget_controller.dart';
import 'package:my_veggielist_app/models/places.dart';
import 'package:get/get.dart';

class PlaceDetailPage extends StatefulWidget {
  final Place place;

  const PlaceDetailPage({Key key, this.place}) : super(key: key);

  @override
  _PlaceDetailPageState createState() => _PlaceDetailPageState();
}

class _PlaceDetailPageState extends State<PlaceDetailPage> {
  var placeId = Get.parameters['id'];
  PlaceDetailController _placeDetailController;

  @override
  void initState() {
    _placeDetailController = Get.put(
      PlaceDetailController(),
    );
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text(_placeDetailController.place.value.image),
    ));
  }
}
*/
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlaceDetailPage extends StatefulWidget {
  @override
  _PlaceDetailPageState createState() => _PlaceDetailPageState();
}

class _PlaceDetailPageState extends State<PlaceDetailPage> {
  List<Marker> allMarkers = [];

  GoogleMapController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allMarkers.add(Marker(
        markerId: MarkerId('myMarker'),
        draggable: true,
        onTap: () {
          print('Marker Tapped');
        },
        position: LatLng(37.5746333, 126.9852542)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('지도'),
      ),
      body: Stack(children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: GoogleMap(
            initialCameraPosition: CameraPosition(
                target: LatLng(37.5746333, 126.9852542), zoom: 15.0),
            markers: Set.from(allMarkers),
            onMapCreated: mapCreated,
          ),
        ),
      ]),
    );
  }

  void mapCreated(controller) {
    setState(() {
      _controller = controller;
    });
  }
}
