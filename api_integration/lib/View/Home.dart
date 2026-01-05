import 'package:api_integration/View/LoginPage.dart';
import 'package:api_integration/View/RegisterPage.dart';
import 'package:api_integration/View/SingleData.dart';
import 'package:api_integration/View/MultidataScreen.dart';
import 'package:api_integration/View/list_data_screen.dart';
import 'package:api_integration/View/userDetailsScreen.dart';
import 'package:api_integration/model/userDetails.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('API Integration'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ApiScreen())),
            child: const Text("Api For SingleData"),
          ),
          ElevatedButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const GetListData())),
            child: const Text("Api For List"),
          ),
          ElevatedButton(
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MultiDataScreen())),
            child: const Text("Api For MultiData"),
          ),
          ElevatedButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const LoginScreen())),
            child: const Text("User Login Api"),
          ),
          ElevatedButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Registerpage())),
            child: const Text("User Register Api"),
          ),
          ElevatedButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Detailscreen())),
            child: const Text("Get User Details"),
          ),
        ]),
      ),
    );
  }
}
