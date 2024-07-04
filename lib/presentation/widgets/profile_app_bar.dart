import 'dart:convert';

import 'package:assignment_manager/app.dart';
import 'package:assignment_manager/presentation/controllers/profile_controller.dart';
import 'package:assignment_manager/presentation/screens/profile/update_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';

PreferredSizeWidget get profileAppBar {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: AppColors.themeColor,
    title: GestureDetector(
      onTap: () {
        Navigator.push(
          AssignmentManagerApp.navigatorKey.currentState!.context,
          MaterialPageRoute(
            builder: (context) => const UpdateProfileScreen(),
          ),
        );
      },
      child: GetBuilder<ProfileController>(builder: (controller){
        if(controller.inProgress){
          return const Text('Please wait..!');
        }else{
          return  Row(
            children: [
              CircleAvatar(radius: 20,
              backgroundImage: MemoryImage(
              base64Decode(controller.profilePhoto),
        )),
              Gap(16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.user!.name,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    controller.user!.email,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ],
              )
            ],
          );
        }
      }
      ),
    ),
  );
}


