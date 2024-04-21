import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oodle_task/app/modules/home/controllers/home_controller.dart';

void priceDialog(BuildContext context, int i) async {
  TextEditingController controller = TextEditingController();
  return showDialog(
    context: context,
    builder: (_) => Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Enter price"),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: controller,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                Get.find<HomeController>().addToCart(i, controller.text);
                Get.back();
              },
              child: const Text("Done"),
            )
          ],
        ),
      ),
    ),
  );
}
