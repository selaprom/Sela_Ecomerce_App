import 'package:ecomerce_24/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:get/get.dart';

import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: _buildAppbar,
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
              ListTile(
                onTap: controller.changeTheme,
                trailing:
                    !controller.ischangetheme.value
                        ? Icon(Icons.light_mode, size: 30)
                        : Icon(Icons.nightlight_round_outlined, size: 30),
                leading: Icon(Icons.light_mode, size: 40),

                subtitle: Text("Tap to change"),
                title: Text(
                  "Change Theme",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                // onTap: controller.changeTheme,
                trailing: AdvancedSwitch(
                  controller: controller.advancedSwitchController,
                  activeColor: Color(0xff7B68EE),
                  inactiveColor: Colors.grey,
                  activeChild: Text('English'),
                  inactiveChild: Text('Khmer'),
                  //activeImage: AssetImage('assets/images/on.png'),
                  // inactiveImage: AssetImage('assets/images/off.png'),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  width: 85.0,
                  height: 30.0,
                  enabled: true,
                  disabledOpacity: 1,
                  // This ensures GetX updates too
                  onChanged: (value) {
                    controller.changSwitch(value);
                    controller.togle(value);
                  },
                ),
                leading: Icon(Icons.language_outlined, size: 40),

                subtitle: Text("Switch To Change Language"),
                title: Text(
                  "Change Language",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  get _buildAppbar => AppBar(title: Text("Setting".tr));
}
