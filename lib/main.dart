import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oodle_task/app/routes/app_pages.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Image Saver',
      getPages: AppPages.routes,
      initialRoute: Routes.HOME,
    );
  }
}
