import 'package:api_integration/controller/GetApi/getApi.dart';
import 'package:api_integration/model/model_for_list.dart';
import 'package:flutter/material.dart';

class GetListData extends StatefulWidget {
  const GetListData({super.key});

  @override
  State<GetListData> createState() => _GetListDataState();
}

class _GetListDataState extends State<GetListData> {
  List<ModelforList> _list = [];
  bool isready = false;
  _getlistPost() {
    isready = true;
    ApiServices().getApiList().then((value) {
      _list = value!;
      isready = false;
    }).onError((error, StackTrace) {
      isready = false;
      print(error.toString());
    });
  }

  @override
  void initState() {
    super.initState();
    _getlistPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Getting data from json"),
        backgroundColor: Colors.deepPurple,
      ),
      body: isready
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _list.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: Text(
                      _list[index].id.toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    title: Text(_list[index].name.toString()),
                    subtitle: Column(
                      children: [
                        Text(
                          _list[index].email.toString(),
                          style: const TextStyle(color: Colors.green),
                        ),
                        Text(
                          _list[index].body.toString(),
                          style: const TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
