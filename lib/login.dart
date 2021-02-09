import 'package:first_project/maindrawer.dart';
import 'package:flutter/material.dart';
import 'requests.dart';
import 'complains.dart';
import 'viewbins.dart';
// import 'viewshedule.dart';
import 'maindrawer.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: <String, WidgetBuilder>{
          '/requests': (BuildContext context) => new RequestsPage(),
          '/viewbins': (BuildContext context) => new ViewbinsPage(),
          '/complains': (BuildContext context) => new ComplainsPage(),
          // '/viewshedule': (BuildContext context) => new ViewshedulePage()
        },
        home: new Scaffold(
            resizeToAvoidBottomPadding: false,
            appBar: AppBar(
              title: Text('Dispose Your Garbage Ontime'),
            ),
            drawer: MainDrawer(),
            body:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                    Widget>[
              Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(15.0, 40.0, 0.0, 0.0),
                      child: Text(
                        'Welcome',
                        style: TextStyle(
                            fontSize: 50.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  padding: EdgeInsets.only(top: 70.0, left: 20.0, right: 20.0),
                  child: Column(
                    children: <Widget>[
                      // Container(
                      //     height: 40.0,
                      //     child: Material(
                      //       borderRadius: BorderRadius.circular(20.0),
                      //       shadowColor: Colors.black,
                      //       color: Colors.blue,
                      //       elevation: 7.0,
                      //       child: GestureDetector(
                      //         onTap: () {
                      //           Navigator.of(context).pushNamed('/viewshedule');
                      //         },
                      //         child: Center(
                      //           child: Text(
                      //             'View Shedule',
                      //             style: TextStyle(
                      //                 color: Colors.white,
                      //                 fontWeight: FontWeight.bold,
                      //                 fontFamily: 'Montserrat'),
                      //           ),
                      //         ),
                      //       ),
                      //     )),
                      SizedBox(height: 20.0),
                      Container(
                          height: 40.0,
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            shadowColor: Colors.black,
                            color: Colors.blue,
                            elevation: 7.0,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed('/viewbins');
                              },
                              child: Center(
                                child: Text(
                                  'View Bins',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat'),
                                ),
                              ),
                            ),
                          )),
                      SizedBox(height: 20.0),
                      Container(
                          height: 40.0,
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            shadowColor: Colors.black,
                            color: Colors.blue,
                            elevation: 7.0,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed('/requests');
                              },
                              child: Center(
                                child: Text(
                                  'Requests',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat'),
                                ),
                              ),
                            ),
                          )),
                      SizedBox(height: 20.0),
                      Container(
                          height: 40.0,
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            shadowColor: Colors.black,
                            color: Colors.blue,
                            elevation: 7.0,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed('/complains');
                              },
                              child: Center(
                                child: Text(
                                  'Complains',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat'),
                                ),
                              ),
                            ),
                          )),
                      SizedBox(height: 70.0),
                      Container(
                        height: 40.0,
                        color: Colors.transparent,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black,
                                  style: BorderStyle.solid,
                                  width: 1.0),
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(20.0)),
                          child: InkWell(
                            onTap: () async {
                              final storage = new FlutterSecureStorage();
                              await storage.deleteAll();
                              Navigator.of(context).pushNamed('/home');
                            },
                            child: Center(
                              child: Text('Log Out',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat')),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
              // SizedBox(height: 15.0),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: <Widget>[
              //     Text(
              //       'New to Spotify?',
              //       style: TextStyle(
              //         fontFamily: 'Montserrat',
              //       ),
              //     ),
              //     SizedBox(width: 5.0),
              //     InkWell(
              //       child: Text('Register',
              //           style: TextStyle(
              //               color: Colors.green,
              //               fontFamily: 'Montserrat',
              //               fontWeight: FontWeight.bold,
              //               decoration: TextDecoration.underline)),
              //     )
              //   ],
              // )
            ])));
  }
}
