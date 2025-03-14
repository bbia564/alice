import 'package:get/get.dart';

import 'expected_mang_logic.dart';

class ExpectedMangBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      PageLogic(),
      permanent: true,
    );
  }
}
