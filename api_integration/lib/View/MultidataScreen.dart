import 'package:api_integration/controller/GetApi/getApi.dart';
import 'package:api_integration/model/multidata_model.dart';
import 'package:flutter/material.dart';

class MultiDataScreen extends StatefulWidget {
  const MultiDataScreen({super.key});

  @override
  State<MultiDataScreen> createState() => _MultiDataScreenState();
}

class _MultiDataScreenState extends State<MultiDataScreen> {
  ModelforMultiData multiData = ModelforMultiData();
  bool isReady = false;
  _getData() {
    isReady = true;
    ApiServices().getApiMultiData().then((value) {
      setState(() {
        multiData = value!;
        isReady = false;
      });
    }).onError((error, StackTrace) {
      print(error.toString());
      isReady = false;
    });
  }

  @override
  void initState() {
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Multi Data'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: isReady
          ? const Center(child: CircularProgressIndicator())
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(multiData.page.toString()),
                Text(multiData.perPage.toString()),
                Text(multiData.title.toString()),
                Text(multiData.total.toString()),
                Text(multiData.support.toString()),
                Expanded(
                  child: ListView.builder(
                    itemCount: multiData.data!.length,
                    itemBuilder: ((context, index) {
                      return Card(
                        elevation: 10,
                        child: ListTile(
                          leading: Text(multiData.data![index].id.toString()),
                          subtitle: Column(
                            children: [
                              Text(multiData.data![index].email.toString()),
                              Text(
                                  "${multiData.data![index].firstName} ${multiData.data![index].lastName}"),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
    );
  }
}
