import 'package:expected_date/db_expected/db_expected.dart';
import 'package:expected_date/pages/expected_first/expected_first_binding.dart';
import 'package:expected_date/pages/expected_first/expected_first_view.dart';
import 'package:expected_date/pages/expected_mang/expected_mang_binding.dart';
import 'package:expected_date/pages/expected_mang/expected_mang_view.dart';
import 'package:expected_date/pages/expected_second/expected_second_binding.dart';
import 'package:expected_date/pages/expected_second/expected_second_check.dart';
import 'package:expected_date/pages/expected_second/expected_second_view.dart';
import 'package:expected_date/pages/expected_tab/expected_tab_binding.dart';
import 'package:expected_date/pages/expected_tab/expected_tab_view.dart';
import 'package:expected_date/pages/expected_third/expected_third_binding.dart';
import 'package:expected_date/pages/expected_third/expected_third_view.dart';
import 'package:expected_date/pages/no_network/no_network_binding.dart';
import 'package:expected_date/pages/no_network/no_network_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Color primaryColor = const Color(0xffff93da);
Color bgColor = const Color(0xfff7f7f7);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => DBExpected().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: Alices,
      initialRoute: '/',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: bgColor,
        colorScheme: ColorScheme.light(
          primary: primaryColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: primaryColor,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        cardTheme: const CardTheme(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        dialogTheme: const DialogTheme(
          actionsPadding: EdgeInsets.only(right: 10, bottom: 5),
        ),
        dividerTheme: DividerThemeData(
          thickness: 1,
          color: Colors.grey[200],
        ),
      ),
    );
  }
}

List<GetPage<dynamic>> Alices = [
  GetPage(name: '/', page: () => const ExpectedMangView(), binding: ExpectedMangBinding()),
  GetPage(name: '/reload', page: () => NoNetworkPage(), binding: NoNetworkBinding()),
  GetPage(name: '/expectedTab', page: () => ExpectedTabPage(), binding: ExpectedTabBinding()),
  GetPage(name: '/expectedCheck', page: () => const ExpectedSecondCheck()),
  GetPage(name: '/expectedFirst', page: () => ExpectedFirstPage(), binding: ExpectedFirstBinding()),
  GetPage(name: '/expectedSecond', page: () => ExpectedSecondPage(), binding: ExpectedSecondBinding()),
  GetPage(name: '/expectedThird', page: () => ExpectedThirdPage(), binding: ExpectedThirdBinding()),
];