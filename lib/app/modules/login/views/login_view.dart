import 'package:ecomerce_24/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({super.key});
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController(text: "tola@gmail.com");
  final passwordController = TextEditingController(text: "123");

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: buildBody);
  }

  get buildBody => Padding(
    padding: EdgeInsets.all(20),
    child: Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 20,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome to login",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Text("Please signin to continue"),
            ],
          ),

          TextFormField(
            controller: emailController,
            decoration: InputDecoration(
              hintText: "Email",
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Email can't be Null";
              }
              if (!GetUtils.isEmail(value)) {
                return "Invalid Email";
              }
            },
          ),
          TextFormField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Password",
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Password can't be Null";
              }
            },
          ),

          TextButton.icon(
            onPressed: () {
              final email = emailController.text;

              final password = passwordController.text;

              if (_formKey.currentState!.validate()) {
                controller.login(email: email, password: password);
              }
            },
            label: Text("Login"),
            icon: Icon(Icons.save_alt),
          ),
          Row(
            //spacing: 10,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't have account "),
              TextButton(
                onPressed: () {
                  Get.toNamed(Routes.REGISTER);
                },
                child: Text(
                  "Register",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            ],
          ),
          // Spacer(),
          ElevatedButton(
            onPressed: () {
              Get.offAllNamed(Routes.MAIN);
            },
            child: Text("Skip"),
          ),
        ],
      ),
    ),
  );
}
