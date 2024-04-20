import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oodle_task/app/modules/home/controllers/home_controller.dart';
import 'package:oodle_task/app/modules/home/widgets/price_dialog.dart';

class HistoryScreen extends StatelessWidget {
  final HomeController controller;
  const HistoryScreen({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.storedImages.length,
          itemBuilder: (BuildContext context, int index) {
            return listItem(index, context);
          },
        ),
      ),
    );
  }

  Widget listItem(int i, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          Image.file(
            File(
              controller.storedImages[i],
            ),
            height: 200,
            width: double.infinity,
            fit: BoxFit.contain,
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () => priceDialog(context, i),
            child: const Text("Add to Cart"),
          )
        ],
      ),
    );
  }
}
