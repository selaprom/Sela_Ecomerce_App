import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(Icons.edit),
            ),
          ),
        ],
      ),
      body: Obx(
        () =>
            controller.isLoading.value == true
                ? Center(child: CircularProgressIndicator())
                : _buildBody,
      ),
    );
  }

  get _buildBody {
    final profile = controller.profile.value;
    return Column(
      children: [
        SizedBox(height: 60),
        Stack(
          alignment: Alignment.topCenter,
          clipBehavior: Clip.none,
          children: [
            Container(
              margin: EdgeInsets.all(15),
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),

                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.purpleAccent, Colors.lightBlueAccent],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,

                children: [
                  SizedBox(height: 80),
                  Text(
                    "Name:${profile!.name}",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  Text(
                    "Email:${profile!.email}",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ),
            Positioned(
              top: -40,
              child: Container(
                height: 118,
                width: 118,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 3, color: Colors.white),

                  image: DecorationImage(
                    image:
                        profile!.avatar == null
                            ? AssetImage('assets/images/no-profile.png')
                            : NetworkImage(profile!.avatar ?? ""),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
