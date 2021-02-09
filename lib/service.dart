import 'dart:convert';

import 'package:http/http.dart' as http;

class Service {
  final URL = "http://10.0.2.2:3000/";

  exec(meta, obj) async {
    var res = await http.post(URL + meta,
        body: json.encode(obj), headers: {"Content-Type": "application/json"});
    Map<String, dynamic> data = json.decode(res.body);
    return data;
  }
}
