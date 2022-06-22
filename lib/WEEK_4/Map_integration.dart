import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart' as prefix;


const kGoogleApiKey = "AIzaSyDJdsa3g6TdmOCfwJs2A5_xZbTWpKjezCk";

class Map_integration extends StatefulWidget {
  const Map_integration({Key? key}) : super(key: key);

  @override
  State<Map_integration> createState() => _Map_integrationState();
}

class _Map_integrationState extends State<Map_integration> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  late GoogleMapController mapController;
  Set<Marker> markers = {};
  static final CameraPosition _initialLocation = CameraPosition(
      target: LatLng(21.24149, 72.88487), zoom: 14.5, bearing: 30);
  late Position _currentPosition;
  final endController = TextEditingController();
  final startController = TextEditingController();

  final startAddressFocusNode = FocusNode();
  final desrinationAddressFocusNode = FocusNode();

  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();

  final prefix.GoogleMapsPlaces _places =
      prefix.GoogleMapsPlaces(apiKey: kGoogleApiKey);

  late prefix.PlaceDetails endPoint;
  late prefix.PlaceDetails startPoint;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getDirections();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Stack(
          children: [
            GoogleMap(
              markers: Set.from(markers),
              initialCameraPosition: _initialLocation,
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              mapType: MapType.normal,
              zoomGesturesEnabled: true,
              zoomControlsEnabled: false,
              onTap: _handleTap,
              polylines: Set<Polyline>.of(polylines.values),
              onMapCreated: (GoogleMapController controller) {
                mapController = controller;
              },
            ),

            // show search place
            SafeArea(
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 250,
                              // margin: EdgeInsets.only(left: 130),
                              alignment: Alignment.center,
                              child: const Text(
                                'Places',
                                style: TextStyle(fontSize: 20.0),
                              ),
                            ),
                            // ElevatedButton(
                            //   onPressed: () {
                            //     setState(() {
                            //       markers.clear();
                            //       polylines.clear();
                            //       startController.clear();
                            //       endController.clear();
                            //       // polylineCoordinates.clear();
                            //     });
                            //   },
                            //   child: const Text("Reset"),
                            // ),
                          ],
                        ),

                        // start searchplase
                        // SizedBox(height: 5),
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(left: 10, right: 10, top: 3),
                          width: MediaQuery.of(context).size.width - 15,
                          child: TextField(
                            readOnly: true,
                            // enableInteractiveSelection: true,
                            onTap: () async {
                              prefix.Prediction? p =
                                  await PlacesAutocomplete.show(
                                      context: context,
                                      apiKey: kGoogleApiKey,
                                      mode: Mode.overlay,
                                      language: "en",
                                      types: [],
                                      strictbounds: false,
                                      components: [
                                        prefix.Component(
                                            prefix.Component.country, "ind")
                                      ]);
                              startLocationSearch(p!);
                            },
                            focusNode: startAddressFocusNode,
                            controller: startController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              prefixIcon: Icon(Icons.looks_one),
                              labelText: "Search Location",
                              suffixIcon: Icon(Icons.search_rounded),
                            ),
                          ),
                        ),

                        // SizedBox(height: 5),
                        // end search place
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          alignment: Alignment.center,
                          margin: EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width - 15,
                          child: TextField(
                            readOnly: true,
                            // enableInteractiveSelection: true,
                            onTap: () async {
                              prefix.Prediction? p =
                                  await PlacesAutocomplete.show(
                                      context: context,
                                      apiKey: kGoogleApiKey,
                                      mode: Mode.overlay,
                                      language: "en",
                                      types: [],
                                      strictbounds: false,
                                      components: [
                                        prefix.Component(
                                            prefix.Component.country, "ind")
                                      ]);
                              endLocationSearch(p!);
                            },
                            focusNode: desrinationAddressFocusNode,
                            controller: endController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              prefixIcon: Icon(Icons.looks_two),
                              labelText: "Search second Location",
                              suffixIcon: Icon(Icons.search_rounded),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // show current location
            SafeArea(
              child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0, bottom: 10.0),
                  child: ClipOval(
                    child: Material(
                      color: Colors.blue, // button color
                      child: InkWell(
                        splashColor: Colors.orange, // inkwell color
                        child: SizedBox(
                          width: 56,
                          height: 56,
                          child: Icon(Icons.my_location),
                        ),
                        onTap: () async {
                          _currentPosition = await _determinePosition();
                          mapController.animateCamera(
                              CameraUpdate.newCameraPosition(CameraPosition(
                                  target: LatLng(_currentPosition.latitude,
                                      _currentPosition.longitude),
                                  zoom: 14.5)));
                          // markers.clear();

                          markers.add(Marker(
                              markerId: MarkerId('currentLocation'),
                              position: LatLng(_currentPosition.latitude,
                                  _currentPosition.longitude)));

                          setState(() {});
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Multipal Marker
  _handleTap(LatLng tappedPoint) {
    setState(() {
      markers.add(
        Marker(
          markerId: MarkerId(tappedPoint.toString()),
          position: tappedPoint,
          infoWindow: const InfoWindow(
            title: "Multi point",
          ),
        ),
      );
    });
  }

  // permission
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied');
    }

    _currentPosition = await Geolocator.getCurrentPosition();

    return _currentPosition;
  }

  // start search place
  Future<void> startLocationSearch(prefix.Prediction p) async {
    if (p != null) {
      prefix.PlacesDetailsResponse detail =
          await _places.getDetailsByPlaceId(p.placeId!);
      final lat = detail.result.geometry!.location.lat;
      final lng = detail.result.geometry!.location.lng;

      startPoint = detail.result;
      startController.text = detail.result.name;

      mapController.animateCamera(
        CameraUpdate.newCameraPosition(
            CameraPosition(target: LatLng(lat, lng), zoom: 10.0)),
      );
      markers.add(Marker(
        markerId: MarkerId("startlocation"),
        position: LatLng(lat, lng),
        infoWindow: InfoWindow(
          title: detail.result.name,
        ),
        onTap: () {
          print(detail.result.name);
        },
      ));
      getDirections();
      setState(() {});
    }
  }

  //end search place
  Future<void> endLocationSearch(prefix.Prediction p) async {
    if (p != null) {
      prefix.PlacesDetailsResponse detail =
          await _places.getDetailsByPlaceId(p.placeId!);
      final lat = detail.result.geometry!.location.lat;
      final lng = detail.result.geometry!.location.lng;

      endPoint = detail.result;
      endController.text = detail.result.name;

      mapController.animateCamera(
        CameraUpdate.newCameraPosition(
            CameraPosition(target: LatLng(lat, lng), zoom: 10.0)),
      );
      markers.add(
        Marker(
          markerId: MarkerId("endlocation"),
          position: LatLng(lat, lng),
          infoWindow: InfoWindow(
            title: detail.result.name,
          ),
          onTap: () {
            print(detail.result.name);
          },
        ),
      );
      getDirections();
      setState(() {});
    }
  }

  // directions between two search place..

  Future<void> getDirections() async {
    List<LatLng> polylineCoordinates = [];

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      kGoogleApiKey,
      PointLatLng(
          startPoint.geometry!.location.lat, startPoint.geometry!.location.lng),
      PointLatLng(
          endPoint.geometry!.location.lat, endPoint.geometry!.location.lng),
      travelMode: TravelMode.driving,
    );
    print(
        "Current Position : - ${startPoint.geometry!.location.lat} & ${startPoint.geometry!.location.lng}");
    print(
        "Destitation Postion : ${endPoint.geometry!.location.lat} & ${endPoint.geometry!.location.lng}");

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      print(result.errorMessage);
    }
    addPolyLine(polylineCoordinates);
  }

  // directions between current location to search place..

  /*
  Future<void> getDirections() async {
    List<LatLng> polylineCoordinates = [];

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      kGoogleApiKey,
      PointLatLng(_currentPosition.latitude, _currentPosition.longitude),
      PointLatLng(
          endPoint.geometry!.location.lat, endPoint.geometry!.location.lng),
      travelMode: TravelMode.driving,
    );
    print(
        "Current Position : - ${_currentPosition.latitude} & ${_currentPosition.longitude}");
    print(
        "Destitation Postion : ${endPoint.geometry!.location.lat} & ${endPoint.geometry!.location.lng}");

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      print(result.errorMessage);
    }
    addPolyLine(polylineCoordinates);
  }
*/
  void addPolyLine(List<LatLng> polylineCoordinates) {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.red.shade500,
      points: polylineCoordinates,
      width: 5,
    );
    polylines[id] = polyline;
    setState(() {});
  }
}
