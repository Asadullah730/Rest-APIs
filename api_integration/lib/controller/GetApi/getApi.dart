import 'dart:convert';
import 'package:api_integration/model/model_for_list.dart';
import 'package:api_integration/model/multidata_model.dart';
import 'package:api_integration/model/userDetails.dart';

import '../../model/api_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  // Get Apis
  Future<PostApiModel?> getApiPost() async {
    try {
      var response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/posts/1"));

      if (response.statusCode == 200 || response.statusCode == 201) {
        PostApiModel model = PostApiModel.fromJson(json.decode(response.body));
        return model;
      } else {
        print("Failed to fetch data: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: ${e.toString()}");
    }
    return null;
  }

// getting list of posts form json holder
  Future<List<ModelforList>?> getApiList() async {
    try {
      var response = await http.get(
          Uri.parse("https://jsonplaceholder.typicode.com/posts/1/comments"));

      if (response.statusCode == 200 || response.statusCode == 201) {
        List<ModelforList> model = List<ModelforList>.from(json
            .decode(response.body)
            .map((data) => ModelforList.fromJson(data)));

        return model;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
    return null;
  }

  // Getting MultiData

  Future<ModelforMultiData?> getApiMultiData() async {
    try {
      var response =
          await http.get(Uri.parse("https://reqres.in/api/users?page=2"));
      if (response.statusCode == 200) {
        ModelforMultiData model =
            ModelforMultiData.fromJson(json.decode(response.body));
        return model;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

//  Getting the details of user

  Future<userDetailsModel?> getApiUserDetails() async {
    try {
      String token =
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImlhdCI6MTczNDUzMzY1MiwiZXhwIjoxNzM2MjYxNjUyfQ.f_wbNToRO64oujMZ_MVvh4Cw54lezYjejgnaXM4FErw";
      var response = await http.get(
          Uri.parse("https://api.escuelajs.co/api/v1/auth/profile"),
          headers: {"Authorization": "Bearer $token"});
      if (response.statusCode == 200) {
        userDetailsModel model =
            userDetailsModel.fromJson(json.decode(response.body));
        return model;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
