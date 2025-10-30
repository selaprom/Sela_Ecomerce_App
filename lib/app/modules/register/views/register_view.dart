import 'package:ecomerce_24/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  RegisterView({super.key});
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final password_confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('RegisterView'), centerTitle: true),
      body: buildBody,
    );
  }

  get buildBody => GetBuilder<RegisterController>(
    init: controller,
    builder: (logic) {
      return Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            spacing: 20,
            children: [
              Stack(
                // clipBehavior: Clip.none,
                // alignment: Alignment.bottomRight,
                children: [
                  controller.image != null
                      ? CircleAvatar(
                        radius: 55,

                        backgroundColor: Colors.blue,
                        backgroundImage: FileImage(controller.image!),
                      )
                      : CircleAvatar(
                        radius: 55,

                        backgroundImage: AssetImage(
                          "assets/images/no-profile.png",
                        ),
                      ),
                  Positioned(
                    right: -10,
                    bottom: 0,

                    child: IconButton(
                      onPressed: controller.pickImage,
                      icon: Icon(Icons.camera_alt_rounded, color: Colors.black),
                    ),
                  ),
                ],
              ),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: "Name",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Name can't be Null";
                  }
                },
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
              TextFormField(
                controller: password_confirmController,
                decoration: InputDecoration(
                  hintText: "Confirm_Password",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Confirm Password can't be Null";
                  }
                },
              ),
              TextButton.icon(
                onPressed: () {
                  final email = emailController.text;
                  final name = nameController.text;
                  final password = passwordController.text;
                  final confirmPass = password_confirmController.text;
                  if (password != confirmPass) {
                    Get.snackbar("Message", "Password does not match");
                    return;
                  }
                  if (_formKey.currentState!.validate()) {
                    controller.register(
                      email: email,
                      password: password,
                      confirmPass: confirmPass,
                      name: name,
                    );
                  }
                },
                label: Text("Register"),
                icon: Icon(Icons.save_alt),
              ),
              Row(
                //spacing: 10,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account "),
                  TextButton(
                    onPressed: () {
                      Get.toNamed(Routes.LOGIN);
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
