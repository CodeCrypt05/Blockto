import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Loader {
  static void showLoader() {
    Get.dialog(
      const AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(
              color: Color(0xffDB8C09),
            ),
            SizedBox(height: 16),
            Text("Loading..."),
          ],
        ),
      ),
      barrierDismissible: false, // Prevent dismissing with a tap outside
    );
  }
}
