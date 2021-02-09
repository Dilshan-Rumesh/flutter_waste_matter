// import 'package:first_project/services/auth.dart';

import 'package:flutter/material.dart';
import 'signup.dart';
import 'login.dart';
import 'requests.dart';
import 'complains.dart';
import 'viewbins.dart';
import 'viewshedule.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:dio/dio.dart';
import './service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/signup': (BuildContext context) => new SignupPage(),
        '/login': (BuildContext context) => new LoginPage(),
        '/requests': (BuildContext context) => new RequestsPage(),
        '/complains': (BuildContext context) => new ComplainsPage(),
        '/viewbins': (BuildContext context) => new ViewbinsPage(),
        '/viewshedule': (BuildContext context) => new ViewshedulePage(),
        '/home': (BuildContext context) => new MyHomePage()
      },
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // final AuthService _auth = AuthService();
  var api = Service();
  final email = TextEditingController();
  final pwd = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Authentication Error'),
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

    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Column(
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(25.0, 70.0, 0.0, 0.0),
                    child: Text(
                      'Waste Management...',
                      style: TextStyle(
                          fontSize: 40.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(265.0, 118.0, 0.0, 0.0),
                    child: Text(
                      '...',
                      style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                  ),
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                child: Column(
                  children: <Widget>[
                    Form(
                        key: formkey,
                        child: Column(
                          children: [
                            TextFormField(
                                controller: email,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter email';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  labelText: 'EMAIL',
                                  labelStyle: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.green)),
                                )),
                            SizedBox(height: 50.0),
                            TextFormField(
                              controller: pwd,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter password';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                labelText: 'PASSWORD',
                                labelStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.green)),
                              ),
                              obscureText: true,
                            ),
                            SizedBox(height: 5.0),
                          ],
                        )),
                    Container(
                      alignment: Alignment(1.0, 0.0),
                      padding: EdgeInsets.only(top: 15.0, left: 20.0),
                      child: InkWell(
                        child: Text(
                          'Forgot Password',
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Container(
                      height: 40.0,
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.greenAccent,
                        color: Colors.green,
                        elevation: 7.0,
                        child: GestureDetector(
                          onTap: () async {
                            // Navigator.of(context).pushNamed('/login');
                            // http.get('http://10.0.2.2:3000/users');
                            if (this.formkey.currentState.validate()) {
                              Map<String, dynamic> respons =
                                  await api.exec("login", {
                                "email": this.email.text,
                                "pwd": this.pwd.text,
                              });

                              if (respons["status"] == "success") {
                                final storage = new FlutterSecureStorage();
                                await storage.deleteAll().then((value) async {
                                  await storage.write(
                                      key: "name",
                                      value: respons["values"]["name"]);
                                  await storage.write(
                                      key: "address",
                                      value: respons["values"]["address"]);
                                });

                                Navigator.of(context).pushNamed('/login');
                                print(respons["values"]["id"]);
                              } else {
                                _showMyDialog();
                              }
                            }
                          },
                          child: Center(
                            // child: RaisedButton(
                            child: Text(
                              'LOGIN',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat'),
                            ),
                            // onPressed: () async {
                            //   dynamic result = await _auth.signInAnon();
                            //   if (result == null) {
                            //     print('error signing in');
                            //   } else {
                            //     print('signed in');
                            //     print(result);
                            //   }
                            // }),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Center(
                              child:
                                  ImageIcon(AssetImage('assets/facebook.png')),
                            ),
                            SizedBox(width: 10.0),
                            Center(
                              child: Text('Log in with facebook',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat')),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )),
            SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'New User?',
                  style: TextStyle(fontFamily: 'Montserrat'),
                ),
                SizedBox(width: 5.0),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('/signup');
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(
                        color: Colors.green,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  ),
                )
              ],
            )
          ],
        ));
  }
}
