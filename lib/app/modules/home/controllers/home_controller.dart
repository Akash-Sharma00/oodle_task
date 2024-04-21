import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:oodle_task/app/models/cart_model.dart';
import 'package:oodle_task/app/modules/home/services/api_service.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  RxString imageUrl = ''.obs;
  RxBool loader = false.obs;
  late SharedPreferences prefs;
  RxList<String> storedImages = <String>[].obs;
  RxList<CartModel> cartImages = <CartModel>[].obs;
  RxInt total = 0.obs;

  @override
  void onInit() async {
    prefs = await SharedPreferences.getInstance();
    storedImages.value = prefs.getStringList("stored") ?? [];
    String data = prefs.getString("cart") ?? "";
    if (data.isNotEmpty) {
      List list = jsonDecode(data);
      for (var i = 0; i < list.length; i++) {
        cartImages
            .add(CartModel(path: list[i]['path'], price: list[i]['price']));
        total += int.tryParse(list[i]['price']) ?? 0;
      }
    }
    super.onInit();
  }

  void loadImage() async {
    loader.value = true;
    imageUrl.value = await ApiServie.getUrl();
    if (imageUrl.isEmpty) {
      Get.snackbar("Image Not found", "Please try again");
    } else {
      _saveImage(imageUrl.value);
    }
    loader.value = false;
  }

  Future<void> _saveImage(String url) async {
    try {
      final http.Response response = await http.get(Uri.parse(url));

      final dir = await getTemporaryDirectory();

      var time = DateTime.now().millisecondsSinceEpoch;

      var filename = '${dir.path}/$time.png';

      storedImages.value = [filename, ...storedImages];

      prefs.setStringList("stored", storedImages);

      final file = File(filename);
      await file.writeAsBytes(response.bodyBytes);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  void addToCart(int index, String price) {
    CartModel model = CartModel(path: storedImages[index], price: price);
    cartImages.value = [model, ...cartImages];

    List<Map> mapList = [];
    total += int.tryParse(price) ?? 0;

    for (var i = 0; i < cartImages.length; i++) {
      mapList.add(cartImages[i].toMap());
    }
    String data = jsonEncode(mapList);
    prefs.setString("cart", data);
  }
}
