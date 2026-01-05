import 'package:api_integration/controller/GetApi/getApi.dart';
import 'package:api_integration/model/userDetails.dart';
import 'package:flutter/material.dart';

class Detailscreen extends StatefulWidget {
  const Detailscreen({super.key});

  @override
  State<Detailscreen> createState() => _DetailscreenState();
}

class _DetailscreenState extends State<Detailscreen> {
  userDetailsModel _model = userDetailsModel();

  getuserData() {
    ApiServices().getApiUserDetails().then((value) {
      _model = value!;
      print(_model);
    }).onError((error, StackTrace) {
      print(error.toString());
    });
  }

  @override
  void initState() {
    getuserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("User Profiles"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
          child: Column(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(_model.avatar.toString()),
            radius: 50,
          ),
          Text(_model.id.toString()),
          Text(_model.email.toString()),
          Text(_model.name.toString()),
          Text(_model.password.toString()),
          Text(_model.role.toString())
        ],
      )),
    );
  }
}
