import 'package:flutter/material.dart';
import 'dart:async';

// import 'package:flutter/services.dart';
// import 'package:geo_location_finder/geo_location_finder.dart';

// void main() => runApp(new Myapps());

// class Myapps extends StatefulWidget {
//   @override
//   _MyappsState createState() => new _MyappsState();
// }

// class _MyappsState extends State<Myapps> {
//   String _result = 'Unknown';

//   @override
//   void initState() {
//     super.initState();
//     _getLocation();
//   }

//   /*
//     *  Method :- _getLocation
//     *  Return Type : void
//     *  Parameters :
//     *
//     *
//     * This method will invoke Location Plugin and will give a Map Object in response.
//     * */

//   Future<void> _getLocation() async {
//     Map<dynamic, dynamic> locationMap;

//     String result;

//     try {
//       locationMap = await GeoLocation.getLocation;
//       var status = locationMap["status"];
//       if ((status is String && status == "true") ||
//           (status is bool) && status) {
//         var lat = locationMap["latitude"];
//         var lng = locationMap["longitude"];

//         if (lat is String) {
//           result = "Location: ($lat, $lng)";
//         } else {
//           // lat and lng are not string, you need to check the data type and use accordingly.
//           // it might possible that else will be called in Android as we are getting double from it.
//           result = "Location: ($lat, $lng)";
//         }
//       } else {
//         result = locationMap["message"];
//       }
//     } on PlatformException {
//       result = 'Failed to get location';
//     }

//     if (!mounted) return;

//     setState(() {
//       _result = result;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: new Scaffold(
//         appBar: new AppBar(
//           title: const Text('Plugin location app'),
//         ),
//         body: new Center(
//           child: new Text('$_result'),
//         ),
//       ),
//     );
//   }
// }

// class GetLocationPage extends StatefulWidget {
//   @override
//   _GetLocationPageState createState() => _GetLocationPageState();
// }

// class _GetLocationPageState extends State<GetLocationPage> {
//   var location = new Location();

//   Map<String, double> userLocation;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             userLocation == null
//                 ? CircularProgressIndicator()
//                 : Text("Location:" +
//                     userLocation["latitude"].toString() +
//                     " " +
//                     userLocation["longitude"].toString()),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: RaisedButton(
//                 onPressed: () {
//                   _getLocation().then((value) {
//                     setState(() {
//                       userLocation = value;
//                     });
//                   });
//                 },
//                 color: Colors.blue,
//                 child: Text(
//                   "Get Location",
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<Map<String, double>> _getLocation() async {
//     var currentLocation = <String, double>{};
//     try {
//       currentLocation = await location.getLocation();
//     } catch (e) {
//       currentLocation = null;
//     }
//     return currentLocation;
//   }
// }
