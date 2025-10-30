import 'package:ecomerce_24/app/data/provider/api_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../models/profile.dart';

class ProfileController extends GetxController {
  Rx<Profile?> profile = Rx(null);
  var isLoading = true.obs;
  final _apiProvider = Get.find<APIprovider>();
  @override
  void onInit() {
    getprofile();
    super.onInit();
  }

  Future<void> getprofile() async {
    final response = await _apiProvider.getProfile();

    if (response != null) {
      final data = response.data;
      profile.value = Profile.fromJson(data);
      print(profile.value.toString());
    } else {
      print("error on get profile================================");
    }
    try {} catch (e) {
      Get.defaultDialog(title: "Message", content: Text("Error $e"));
    } finally {
      isLoading.value = false;
    }
  }
}
