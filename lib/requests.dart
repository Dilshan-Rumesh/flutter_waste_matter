import 'package:flutter/material.dart';
import './service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class RequestsPage extends StatefulWidget {
  @override
  _RequestsPageState createState() => _RequestsPageState();
}

class _RequestsPageState extends State<RequestsPage> {
  var api = Service();
  final request = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Future<void> _showMyDialog(txt) async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(txt),
            actions: <Widget>[
              TextButton(
                child: Text('ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                  child: Text(
                    'Requests',
                    style:
                        TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
              child: Column(
                children: <Widget>[
                  Form(
                    key: formkey,
                    child: TextFormField(
                        controller: request,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter request';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Tell Us',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                        )),
                  ),
                  SizedBox(height: 30.0),
                  Container(
                    padding: EdgeInsets.only(top: 0.0, left: 270.0, right: 0.0),
                    height: 30.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.greenAccent,
                      color: Colors.green,
                      elevation: 7.0,
                      child: GestureDetector(
                        onTap: () async {
                          if (this.formkey.currentState.validate()) {
                            final storage = new FlutterSecureStorage();
                            var name = await storage.read(key: "name");
                            var address = await storage.read(key: "address");
                            var date = DateTime.now();
                            Map<String, dynamic> respons =
                                await api.exec("request", {
                              "request": this.request.text,
                              "name": name,
                              "date": date.toString(),
                              "address": address
                            });

                            if (respons["status"] == "success") {
                              _showMyDialog("Thank you For Request");
                              Future.delayed(Duration(seconds: 2), () {
                                Navigator.of(context).pushNamed('/login');
                              });
                            } else {
                              _showMyDialog("error");
                            }
                          }
                        },
                        child: Center(
                          child: Text(
                            'Submit',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // TextField(
                  //     decoration: InputDecoration(
                  //   labelText: 'Request',
                  //   labelStyle: TextStyle(
                  //       fontFamily: 'Montserrat',
                  //       fontWeight: FontWeight.bold,
                  //       color: Colors.black),
                  //   focusedBorder: UnderlineInputBorder(
                  //       borderSide: BorderSide(color: Colors.black)),
                  // )),
                  // SizedBox(height: 30.0),
                  // Container(
                  //   padding: EdgeInsets.only(top: 0.0, left: 270.0, right: 0.0),
                  //   height: 30.0,
                  //   child: Material(
                  //     borderRadius: BorderRadius.circular(20.0),
                  //     shadowColor: Colors.greenAccent,
                  //     color: Colors.green,
                  //     elevation: 7.0,
                  //     child: GestureDetector(
                  //       onTap: () {
                  //         Navigator.of(context).pop();
                  //       },
                  //       child: Center(
                  //         child: Text(
                  //           'Submit',
                  //           style: TextStyle(
                  //               color: Colors.white,
                  //               fontWeight: FontWeight.bold,
                  //               fontFamily: 'Montserrat'),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
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
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Center(
                          child: Text('Back',
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
        ]));
  }
}
