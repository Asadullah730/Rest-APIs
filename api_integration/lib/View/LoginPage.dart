import 'package:api_integration/View/Home.dart';
import 'package:api_integration/controller/PostApi/postApi.dart';
import 'package:api_integration/model/PostApi/LoginApiModel.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isReady = false;
  LoginModel _loginModel = LoginModel();
  _getLoginResponse() {
    isReady = true;
    PostApiServices()
        .userLogin(_emailController.text, _passwordController.text)
        .then((value) {
      isReady = false;
      setState(() {
        _loginModel = value!;
        print("Token ..........." + _loginModel.token.toString());
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Home()));
        // if (_loginModel.token == "QpwL5tke4Pnpja7X4") {
        //   Navigator.pushReplacement(
        //       context, MaterialPageRoute(builder: (context) => Home()));
        // } else {
        //   ScaffoldMessenger.of(context).showSnackBar(
        //       SnackBar(content: Text("Invalid Email or password")));
        // }
      });
    }).onError((error, StackTrace) {
      print(error);
      isReady = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _getLoginResponse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Login Page"),
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
                controller: _emailController,
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
                  _getLoginResponse();
                },
                child: const Text("Login"))
          ],
        ),
      ),
    );
  }
}
