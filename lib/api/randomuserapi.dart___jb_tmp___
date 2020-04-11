import 'package:http/http.dart';
import 'dart:async';
import 'dart:convert';


const String apiURL = 'http://randomuser.me/api/?results=5';

class UserAPI {
  Future<Map> getUserData() async {
    Response response = await get('$apiURL');

    return json.decode(response.body);
  }
}
