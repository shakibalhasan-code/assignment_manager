import 'package:assignment_manager/presentation/screens/assignment/add_new_assignment_screen.dart';
import 'package:assignment_manager/presentation/widgets/task_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../controllers/all_task_controller.dart';
import '../../utils/app_colors.dart';
import '../../widgets/app_background_widget.dart';
import '../../widgets/profile_app_bar.dart';

class AssignmentScreen extends StatelessWidget {
   AssignmentScreen({super.key});
  final AllTaskController allTaskController = Get.find<AllTaskController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileAppBar,
      body: AppBackgroundWidget(
        child: Column(
          children: [
            GetBuilder<AllTaskController>(
              builder: (controller) {
                return Visibility(
                    visible: controller.inProgress == false,
                    replacement: const Center(child: CircularProgressIndicator()),
                    child: Expanded(
                      child: ListView.builder(
                        itemCount: controller.dataList.length,
                        itemBuilder: (context, index) =>  TaskItem(index: index, controller: controller,),
                      ),
                    ));
              }
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddNewAssignmentScreen(),
            ),
          );
        },
        backgroundColor: AppColors.themeColor,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
