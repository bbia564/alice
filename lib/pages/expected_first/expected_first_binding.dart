import 'package:get/get.dart';

import 'expected_first_logic.dart';

class ExpectedFirstBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ExpectedFirstLogic());
  }
}
