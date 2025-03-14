import 'package:expected_date/pages/expected_second/expected_second_logic.dart';
import 'package:expected_date/pages/expected_third/expected_third_logic.dart';
import 'package:get/get.dart';

import '../expected_first/expected_first_logic.dart';
import 'expected_tab_logic.dart';

class ExpectedTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ExpectedTabLogic());
    Get.lazyPut(() => ExpectedFirstLogic());
    Get.lazyPut(() => ExpectedSecondLogic());
    Get.lazyPut(() => ExpectedThirdLogic());
  }
}
