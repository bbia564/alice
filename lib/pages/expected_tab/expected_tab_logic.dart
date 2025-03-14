import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:expected_date/router/expected_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExpectedTabLogic extends GetxController {

  PageController pageController = PageController();
  var currentIndex = 0.obs;

  void checkNetwork() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.none)) {
      Get.toNamed(ExpectedNames.noNetwork);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    checkNetwork();
    super.onInit();
  }

}
