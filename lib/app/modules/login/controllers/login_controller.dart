import 'package:ecomerce_24/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../data/provider/api_provider.dart';

class LoginController extends GetxController {
  final _apiProvider = Get.put(APIprovider());
  final box = GetStorage();
  RxBool visiblepass = false.obs;
  void visiblepassword() {
    if (visiblepass.value == false) {
      visiblepass.value = true;
      print(visiblepass.value);
    } else {
      visiblepass.value = false;
      print(visiblepass.value);
    }
  }

  Future login({required String email, required String password}) async {
    try {
      final response = await _apiProvider.login(
        email: email,
        password: password,
      );
      if (response.statusCode == 200) {
        final accessToken = response.data['access_token'];
        //  print(accessToken.toString());
        box.write('token', accessToken);
        Get.offAllNamed(Routes.MAIN);
      } else {
        Get.snackbar("Message", "Faild to Login");
      }
    } catch (e) {
      print("Error $e");
    }
  }
}
