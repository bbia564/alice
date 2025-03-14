
import 'package:expected_date/pages/expected_first/expected_first_binding.dart';
import 'package:expected_date/pages/expected_second/expected_second_binding.dart';
import 'package:expected_date/pages/expected_tab/expected_tab_binding.dart';
import 'package:expected_date/pages/expected_tab/expected_tab_view.dart';
import 'package:expected_date/pages/expected_third/expected_third_binding.dart';
import 'package:expected_date/router/expected_names.dart';
import 'package:get/get.dart';

import '../pages/expected_first/expected_first_view.dart';
import '../pages/expected_second/expected_second_view.dart';
import '../pages/expected_third/expected_third_view.dart';
import '../pages/no_network/no_network_binding.dart';
import '../pages/no_network/no_network_view.dart';

class ExpectedPages {

  static pageBuilder({
    required String name,
    required GetPageBuilder page,
    Bindings? binding,
  }) {
    return GetPage(
      name: name,
      page: page,
      binding: binding,
      preventDuplicates: true,
      transition: Transition.cupertino,
      popGesture: true,
    );
  }

  static List<GetPage> list = [
    pageBuilder(name: ExpectedNames.noNetwork, page: () => NoNetworkPage(), binding: NoNetworkBinding()),
    pageBuilder(name: ExpectedNames.expectedTab, page: () => ExpectedTabPage(), binding: ExpectedTabBinding()),
    pageBuilder(name: ExpectedNames.expectedFirst, page: () => ExpectedFirstPage(), binding: ExpectedFirstBinding()),
    pageBuilder(name: ExpectedNames.expectedSecond, page: () => ExpectedSecondPage(), binding: ExpectedSecondBinding()),
    pageBuilder(name: ExpectedNames.expectedThird, page: () => ExpectedThirdPage(), binding: ExpectedThirdBinding()),
  ];
}