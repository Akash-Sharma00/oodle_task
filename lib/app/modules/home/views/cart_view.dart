import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:oodle_task/app/modules/home/controllers/home_controller.dart';

class CartView extends StatelessWidget {
  final HomeController controller;
  const CartView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
      ),
      body: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: controller.cartImages.length,
                itemBuilder: (BuildContext context, int index) {
                  return listItem(index);
                },
              ),
            ),
            Text(
              "  Total: ${controller.total.value}   ",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  Widget listItem(int i) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        children: [
          Image.file(
            File(
              controller.cartImages[i].path,
            ),
            height: 150,
            width: 200,
            fit: BoxFit.contain,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text("   Price:  "),
          Text("${controller.cartImages[i].price} Rs.")
        ],
      ),
    );
  }
}
