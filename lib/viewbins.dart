import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';

class ViewbinsPage extends StatefulWidget {
  @override
  _ViewbinsPageState createState() => _ViewbinsPageState();
}

class _ViewbinsPageState extends State<ViewbinsPage> {
  Geolocator geolocator = Geolocator();

  Position userLocation;
  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    super.initState();

    _getLocation().then((position) {
      userLocation = position;
    });
  }

  double zoomVal = 10.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(FontAwesomeIcons.arrowLeft),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text("Maharagama"),
        actions: <Widget>[
          IconButton(
              icon: Icon(FontAwesomeIcons.search),
              onPressed: () {
                //
              }),
        ],
      ),
      body: Stack(
        children: <Widget>[
          _buildGoogleMap(context),
          _zoomminusfunction(),
          _zoomplusfunction(),
          _buildContainer(),
        ],
      ),
    );
  }

  Widget _zoomminusfunction() {
    return Align(
      alignment: Alignment(-1, -0.8),
      child: IconButton(
          icon: Icon(FontAwesomeIcons.searchMinus, color: Color(0xff6200ee)),
          onPressed: () {
            zoomVal--;
            _minus(zoomVal);
          }),
    );
  }

  Widget _zoomplusfunction() {
    return Align(
      alignment: Alignment(1, -0.8),
      child: IconButton(
          icon: Icon(FontAwesomeIcons.searchPlus, color: Color(0xff6200ee)),
          onPressed: () {
            zoomVal++;
            _plus(zoomVal);
          }),
    );
  }

  Future<Position> _getLocation() async {
    var currentLocation;
    try {
      currentLocation = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
    } catch (e) {
      currentLocation = null;
    }
    return currentLocation;
  }

  Future<void> _minus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(6.849201, 79.924306), zoom: zoomVal)));
  }

  Future<void> _plus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(6.849201, 79.924306), zoom: zoomVal)));
  }

  Widget _buildContainer() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 150.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            SizedBox(width: 8.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  _boxes(6.8472, 79.9266, "Clock Tower Maharagama", "8.00 AM"),
            ),
            SizedBox(width: 8.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  6.849201, 79.924306, "Maharagama", "Collect Bin At 8.05 AM"),
            ),
            SizedBox(width: 8.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(6.8493, 79.9240, "Amity", "Collect Bin At 8.10 AM"),
            ),
            SizedBox(width: 8.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(6.851911, 79.919721, "Wattegedara Junction",
                  "Collect Bin At 8.15 AM"),
            ),
            SizedBox(width: 8.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  6.848790, 79.907168, "Navinna", "Collect Bin At 8.20 AM"),
            ),
            SizedBox(width: 8.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  6.852795, 79.910311, "School Lane", "Collect Bin At 8.25 AM"),
            ),
            SizedBox(width: 8.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  6.848790, 79.907168, "Egodawatta", "Collect Bin At 8.30 AM"),
            ),
            SizedBox(width: 8.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  6.853423,
                  79.906084,
                  "University Of Sri Jayawardanapura",
                  "Collect Bin At 8.35 AM"),
            ),
            SizedBox(width: 8.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  6.857556, 79.908380, "Wijerama", "Collect Bin At 8.40 AM"),
            ),
            SizedBox(width: 8.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  6.8599, 79.9097, "Udahamulla", "Collect Bin At 8.45 AM"),
            ),
            SizedBox(width: 8.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  _boxes(6.8629, 79.9015, "Delkanda", "Collect Bin At 8.55 AM"),
            ),
            SizedBox(width: 8.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  6.8614, 79.9003, "Delkanda Fair", "Collect Bin At 9.00 AM"),
            ),
            SizedBox(width: 8.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(6.8651, 79.8966, "Gamsaba Junction",
                  "Collect Bin At 9.05 AM"),
            ),
            SizedBox(width: 8.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  6.8659, 79.8945, "Nugegoda Kells", "Collect Bin At 9.10 AM"),
            ),
            SizedBox(width: 8.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  6.8663, 79.8934, "Jambugasmulla", "Collect Bin At 9.15 AM"),
            ),
            SizedBox(width: 8.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(6.8697, 79.8884, "Nugegoda Junction",
                  "Collect Bin At 9.20 AM"),
            ),
            SizedBox(width: 8.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  6.8688, 79.8867, "Cool Plannet", "Collect Bin At 9.25 AM"),
            ),
            SizedBox(width: 8.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  _boxes(6.8710, 79.8863, "The Fab", "Collect Bin At 9.30 AM"),
            ),
            SizedBox(width: 8.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  _boxes(6.8703, 79.8897, "Rotary", "Collect Bin At 9.35 AM"),
            ),
            SizedBox(width: 8.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  6.8757, 79.8924, "Pagoda Junction", "Collect Bin At 9.40 AM"),
            ),
            userLocation == null
                ? CircularProgressIndicator()
                : Text("Location:" +
                    userLocation.latitude.toString() +
                    " " +
                    userLocation.longitude.toString()),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () {
                  _getLocation().then((value) {
                    setState(() {
                      userLocation = value;
                    });
                  });
                },
                color: Colors.blue,
                child: Text(
                  "Get Location",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _boxes(double lat, double long, String binname, String time) {
    return GestureDetector(
      onTap: () {
        _gotoLocation(lat, long);
      },
      child: Container(
        child: new FittedBox(
          child: Material(
              color: Colors.white,
              elevation: 14.0,
              borderRadius: BorderRadius.circular(24.0),
              shadowColor: Color(0x802196F3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 180,
                    height: 180,
                    child: ClipRRect(
                      borderRadius: new BorderRadius.circular(24.0),
                      child: Image(
                        fit: BoxFit.fill,
                        image: AssetImage("assets/1.jpg"),
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: myDetailsContainer1(binname, time),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  Widget myDetailsContainer1(String binname, String time) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            children: <Widget>[
              Container(
                  child: Text(
                binname,
                style: TextStyle(
                    color: Color(0xff6200ee),
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold),
              )),
              SizedBox(height: 10),
              Container(
                  child: Text(
                time,
                style: TextStyle(
                    color: Color(0xff6200ee),
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold),
              )),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildGoogleMap(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition:
            CameraPosition(target: LatLng(6.9271, 79.8612), zoom: 12),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        markers: {
          clocktowermaharagamaMarker,
          maharagamaMarker,
          amityMarker,
          wattegedaraMarker,
          navinnaMarker,
          schoollaneMarker,
          edogawattaMarker,
          universityofsrijayawardanapuraMarker,
          wijeramaMarker,
          udahamullaMarker,
          delkandaMarker,
          delkadafairMarker,
          gamsabajunctionMarker,
          nugegodakeellsMarker,
          jambugasmullaMarker,
          nugegodajunctionMarker,
          coolplanetMarker,
          fabnugegodaMarker,
          rotaryMarker,
          pagodaMarker,
        },
      ),
    );
  }

  Future<void> _gotoLocation(double lat, double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(lat, long),
      zoom: 15,
      tilt: 50.0,
      bearing: 45.0,
    )));
  }
}

Marker clocktowermaharagamaMarker = Marker(
  markerId: MarkerId('clocktowermaharagama'),
  position: LatLng(
    6.8472,
    79.9266,
  ),
  infoWindow: InfoWindow(title: 'clocktower maharagama'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker maharagamaMarker = Marker(
  markerId: MarkerId('maharagama'),
  position: LatLng(
    6.849201,
    79.924306,
  ),
  infoWindow: InfoWindow(title: 'Maharagama'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker amityMarker = Marker(
  markerId: MarkerId('amity'),
  position: LatLng(
    6.8493,
    79.9240,
  ),
  infoWindow: InfoWindow(title: 'amity'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker wattegedaraMarker = Marker(
  markerId: MarkerId('wattegedara'),
  position: LatLng(6.851911, 79.919721),
  infoWindow: InfoWindow(title: 'Wattegedara Junction'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker navinnaMarker = Marker(
  markerId: MarkerId('schoollane'),
  position: LatLng(6.852795, 79.910311),
  infoWindow: InfoWindow(title: 'School Lane'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker schoollaneMarker = Marker(
  markerId: MarkerId('schoollane'),
  position: LatLng(6.852795, 79.910311),
  infoWindow: InfoWindow(title: 'School Lane'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker edogawattaMarker = Marker(
  markerId: MarkerId('edogawatta'),
  position: LatLng(6.848790, 79.907168),
  infoWindow: InfoWindow(title: 'Edogawatta'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker universityofsrijayawardanapuraMarker = Marker(
  markerId: MarkerId('universityofsrijayawardanapura'),
  position: LatLng(6.853423, 79.906084),
  infoWindow: InfoWindow(
    title: 'University Of Srijarawardanapura',
  ),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker wijeramaMarker = Marker(
  markerId: MarkerId('wijerama'),
  position: LatLng(6.857556, 79.908380),
  infoWindow: InfoWindow(title: 'Wijerama Junction'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker udahamullaMarker = Marker(
  markerId: MarkerId('udahamulla'),
  position: LatLng(6.8599, 79.9097),
  infoWindow: InfoWindow(title: 'udahamulla station road'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker delkandaMarker = Marker(
  markerId: MarkerId('delkanda'),
  position: LatLng(6.8629, 79.9015),
  infoWindow: InfoWindow(title: 'delkanda Junction'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker delkadafairMarker = Marker(
  markerId: MarkerId('delkadafair'),
  position: LatLng(6.8614, 79.9003),
  infoWindow: InfoWindow(title: 'delkada sunday fair'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker gamsabajunctionMarker = Marker(
  markerId: MarkerId('gamsabajunction'),
  position: LatLng(6.8651, 79.8966),
  infoWindow: InfoWindow(title: 'Gamsaba Junction'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker nugegodakeellsMarker = Marker(
  markerId: MarkerId('nugegodakeells'),
  position: LatLng(6.8659, 79.8945),
  infoWindow: InfoWindow(title: 'nugegodakeells'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker jambugasmullaMarker = Marker(
  markerId: MarkerId('jambugasmulla'),
  position: LatLng(6.8663, 79.8934),
  infoWindow: InfoWindow(title: 'jambugasmulla'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker nugegodajunctionMarker = Marker(
  markerId: MarkerId('nugegodajunction'),
  position: LatLng(6.8697, 79.8884),
  infoWindow: InfoWindow(title: 'Nugegoda Junction'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker coolplanetMarker = Marker(
  markerId: MarkerId('coolplanet'),
  position: LatLng(6.8688, 79.8867),
  infoWindow: InfoWindow(title: 'coolplanet'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker fabnugegodaMarker = Marker(
  markerId: MarkerId('fabnugegoda'),
  position: LatLng(6.8710, 79.8863),
  infoWindow: InfoWindow(title: 'fabnugegoda'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker rotaryMarker = Marker(
  markerId: MarkerId('rotary'),
  position: LatLng(6.8703, 79.8897),
  infoWindow: InfoWindow(title: 'rotary'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker pagodaMarker = Marker(
  markerId: MarkerId('pagoda'),
  position: LatLng(6.8757, 79.8924),
  infoWindow: InfoWindow(title: 'pagoda'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
