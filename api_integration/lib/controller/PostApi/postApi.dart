import 'dart:convert';
import 'package:api_integration/model/PostApi/RegisterApiModel.dart';
import 'package:http/http.dart' as http;

import 'package:api_integration/model/PostApi/LoginApiModel.dart';

class PostApiServices {
  Future<LoginModel?> userLogin(String email, String password) async {
    try {
      var url = Uri.parse('https://reqres.in/api/login');

      var response =
          await http.post(url, body: {"email": email, "password": password});

      if (response.statusCode == 200) {
        LoginModel model = LoginModel.fromJson(json.decode(response.body));
        return model;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  // ignore: non_constant_identifier_names
  Future<Registerapimodel?> RegisterUser(String email, String password) async {
    try {
      var url = Uri.parse('https://reqres.in/api/register');

      var response =
          await http.post(url, body: {"email": email, "password": password});

      if (response.statusCode == 200) {
        Registerapimodel model =
            Registerapimodel.fromJson(json.decode(response.body));
        return model;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
