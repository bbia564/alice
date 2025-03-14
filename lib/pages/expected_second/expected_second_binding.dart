import 'package:get/get.dart';

import 'expected_second_logic.dart';

class ExpectedSecondBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ExpectedSecondLogic());
  }
}
