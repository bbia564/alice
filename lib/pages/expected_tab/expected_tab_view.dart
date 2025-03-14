import 'package:expected_date/pages/expected_first/expected_first_logic.dart';
import 'package:expected_date/pages/expected_first/expected_first_view.dart';
import 'package:expected_date/pages/expected_second/expected_second_logic.dart';
import 'package:expected_date/pages/expected_second/expected_second_view.dart';
import 'package:expected_date/pages/expected_third/expected_third_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'expected_tab_logic.dart';

class ExpectedTabPage extends GetView<ExpectedTabLogic> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        children: [
          ExpectedFirstPage(),
          ExpectedSecondPage(),
          ExpectedThirdPage()
        ],
      ),
      bottomNavigationBar: Obx(()=>_navExBars()),
    );
  }

  Widget _navExBars() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Image.asset('assets/item0Grey.webp',width: 22,height: 22,fit: BoxFit.cover,),
          activeIcon: Image.asset('assets/item0Light.webp',width: 22,height: 22,fit: BoxFit.cover,),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/item1Grey.webp',width: 22,height: 22,fit: BoxFit.cover,),
          activeIcon: Image.asset('assets/item1Light.webp',width: 22,height: 22,fit: BoxFit.cover,),
          label: 'Records',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/item2Grey.webp',width: 22,height: 22,fit: BoxFit.cover,),
          activeIcon: Image.asset('assets/item2Light.webp',width: 22,height: 22,fit: BoxFit.cover,),
          label: 'Setting',
        ),
      ],
      currentIndex: controller.currentIndex.value,
      onTap: (index) {
        controller.currentIndex.value = index;
        controller.pageController.jumpToPage(index);
        if (index == 0) {
          ExpectedFirstLogic firstLogic = Get.put(ExpectedFirstLogic());
          firstLogic.getData();
        } else if (index == 1) {
          ExpectedSecondLogic secondLogic = Get.put(ExpectedSecondLogic());
          secondLogic.getData();
        }
      },
    );
  }
}
