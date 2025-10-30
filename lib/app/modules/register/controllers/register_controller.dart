import 'dart:io';

import 'package:ecomerce_24/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/provider/api_provider.dart';

class RegisterController extends GetxController {
  final _imagePicker = ImagePicker();
  File? image;
  final _apiProvider = Get.find<APIprovider>();
  final box = GetStorage();
  void pickImage() async {
    final file = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      image = File(file.path);
    }
    update();
  }

  Future<void> register({
    required String email,
    required String password,
    required String confirmPass,
    required String name,
  }) async {
    try {
      final fcm_token = box.read('fcm_token');
      final response = await _apiProvider.register(
        fcm_token: fcm_token,
        email: email,
        password: password,
        confirmPass: confirmPass,
        name: name,
        image: image,
      );
      if (response.statusCode == 200) {
        Get.defaultDialog(
          title: "success",
          content: Text("you register success"),
          confirm: TextButton(
            onPressed: () {
              Get.back();
              Get.offAllNamed(Routes.LOGIN);
            },
            child: Text("Ok"),
          ),
        );
      } else {
        Get.defaultDialog(
          title: "failed",
          content: Text("you register failed"),
        );
      }
    } catch (e) {
      print("error $e");
    }
  }
}
