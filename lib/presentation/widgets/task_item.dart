import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/all_task_controller.dart';

class TaskItem extends StatelessWidget {
  int index;
  AllTaskController controller;

  TaskItem({super.key, required this.index, required this.controller});

  final AllTaskController allTaskController = Get.find<AllTaskController>();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              controller.dataList[index].title.toString().toString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              controller.dataList[index].description.toString(),
            ),
            Row(
              children: [
                const Chip(label: Text('New')),
                const Spacer(),
                IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
