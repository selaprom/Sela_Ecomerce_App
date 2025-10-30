import 'package:ecomerce_24/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            ListTile(
              onTap: () {
                Get.toNamed(Routes.PROFILE);
              },
              trailing: Icon(Icons.navigate_next, size: 35),
              leading: Icon(Icons.person, size: 40),
              subtitle: Text("View Your Profile"),
              title: Text(
                "Profile",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              onTap: controller.removeToken,
              trailing: Icon(Icons.navigate_next, size: 35),
              leading: Icon(Icons.logout, size: 40),
              subtitle: Text("Signout your account"),
              title: Text(
                "Signout",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
