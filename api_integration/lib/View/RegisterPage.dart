import 'package:api_integration/View/LoginPage.dart';
import 'package:api_integration/controller/PostApi/postApi.dart';
import 'package:api_integration/model/PostApi/RegisterApiModel.dart';
import 'package:flutter/material.dart';

class Registerpage extends StatefulWidget {
  const Registerpage({super.key});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  final TextEditingController _eamilController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  Registerapimodel model = Registerapimodel();

  _getRegisterResponse() {}

  @override
  void initState() {
    // _getRegisterResponse();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Register Page"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      extendBody: true,
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Email :",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextField(
                controller: _eamilController,
                decoration: const InputDecoration(
                  hintText: 'Enter your email',
                )),
            const SizedBox(
              height: 30,
            ),
            const Text("Password :",
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  hintText: 'Enter your password',
                )),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
                onPressed: () {
                  PostApiServices()
                      .RegisterUser(_eamilController.text.toLowerCase(),
                          _passwordController.text.toLowerCase())
                      .then((value) {
                    setState(() {
                      model = value!;
                      print("Register token : ${model.token.toString()}");
                      print(
                          "Register id............. : ${model.id.toString()}");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                    });
                  }).onError((error, StackTrace) {
                    print(error.toString());
                  });
                },
                child: const Text("Register"))
          ],
        ),
      ),
    );
  }
}
