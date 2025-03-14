import 'package:get/get.dart';

import 'expected_third_logic.dart';

class ExpectedThirdBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ExpectedThirdLogic());
  }
}
