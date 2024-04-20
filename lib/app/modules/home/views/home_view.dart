import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oodle_task/app/modules/home/views/cart_view.dart';
import 'package:oodle_task/app/modules/home/views/history_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text('Home Screen'),
          actions: [
            IconButton(
                onPressed: () => Get.to(() => CartView(controller: controller)),
                icon: Badge(
                    label: Text(controller.cartImages.length.toString()),
                    child: const Icon(Icons.shopping_cart_outlined))),
            IconButton(
                onPressed: () =>
                    Get.to(() => HistoryScreen(controller: controller)),
                icon: const Icon(Icons.history_sharp)),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (controller.imageUrl.value.isNotEmpty)
                SizedBox(
                    width: double.infinity,
                    height: 500,
                    child: Image.network(controller.imageUrl.value)),
              const SizedBox(
                height: 20,
              ),
              Visibility(
                  visible: !controller.loader.value,
                  replacement: const CircularProgressIndicator(),
                  child: ElevatedButton(
                      onPressed: () => controller.loadImage(),
                      child: const Text("Fetch Image")))
            ],
          ),
        ),
      ),
    );
  }
}
