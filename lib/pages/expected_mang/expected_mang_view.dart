import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'expected_mang_logic.dart';

class ExpectedMangView extends GetView<PageLogic> {
  const ExpectedMangView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => controller.bogisich.value
              ? const CircularProgressIndicator(color: Colors.pinkAccent)
              : buildError(),
        ),
      ),
    );
  }

  Widget buildError() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              controller.adfj();
            },
            icon: const Icon(
              Icons.restart_alt,
              size: 50,
            ),
          ),
        ],
      ),
    );
  }
}
