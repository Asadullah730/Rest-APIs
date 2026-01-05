import 'package:api_integration/controller/GetApi/getApi.dart';
import 'package:api_integration/model/api_model.dart';
import 'package:api_integration/model/model_for_list.dart';
import 'package:flutter/material.dart';

class ApiScreen extends StatefulWidget {
  const ApiScreen({super.key});

  @override
  State<ApiScreen> createState() => _ApiscreenState();
}

class _ApiscreenState extends State<ApiScreen> {
  bool isready = false;

  PostApiModel postApiModel = PostApiModel();

  _getPostdata() {
    isready = true;
    ApiServices().getApiPost().then((value) {
      setState(() {
        postApiModel = value!;
        isready = false;
      });
    }).onError((error, stackTrace) {
      print(error);
      setState(() {
        isready = false;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getPostdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("API Integration"),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: isready
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(postApiModel.userId.toString()),
                  Text(postApiModel.id.toString()),
                  Text(postApiModel.title.toString()),
                  Text(postApiModel.body.toString())
                ],
              ));
  }
}
