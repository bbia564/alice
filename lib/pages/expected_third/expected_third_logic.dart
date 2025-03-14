import 'package:expected_date/db_expected/db_expected.dart';
import 'package:expected_date/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:styled_widget/styled_widget.dart';

class ExpectedThirdLogic extends GetxController {
  DBExpected dbExpected = Get.find<DBExpected>();

  cleanExpectedData() async {
    Get.dialog(AlertDialog(
      title: const Text('Warm reminder'),
      content: const Text('Do you want to clean all records?'),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text(
            'Cancel',
            style: TextStyle(color: Colors.black),
          ),
        ),
        TextButton(
          onPressed: () async {
            await dbExpected.cleanExpectedData();
            Get.back();
          },
          child: const Text(
            'OK',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    ));
  }

  showExpectedTime() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var expectedTime = DateTime.now();
    if (prefs.getString('expectedTime') != null) {
      expectedTime = DateTime.parse(prefs.getString('expectedTime')!);
    }

    Get.dialog(<Widget>[
      GetBuilder<ExpectedThirdLogic>(
          id: 'expectedTime',
          builder: (_) {
            return Container(
              width: double.infinity,
              height: 350,
              padding:const EdgeInsets.all(12),
              child: <Widget>[
                const Text(
                  'Set due date',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.black,
                      decoration: TextDecoration.none),
                ),
                DateTimePickerWidget(
                  dateFormat: 'yyyy-MM-dd',
                  minDateTime: DateTime.now().add(const Duration(days: 30)),
                  maxDateTime: DateTime.now().add(const Duration(days: 40 * 7)),
                  pickerTheme: const DateTimePickerTheme(
                      showTitle: false, cancel: null, confirm: null),
                  initDateTime: expectedTime,
                  onChange: (dateTime, List<int> index) {
                    expectedTime = dateTime;
                    update(['expectedTime']);
                  },
                ).marginSymmetric(vertical: 15),
                Container(
                  width: double.infinity,
                  height: 50,
                  alignment: Alignment.center,
                  child: const Text(
                    'Commit',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        decoration: TextDecoration.none),
                  ),
                )
                    .decorated(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(12))
                    .gestures(onTap: () async {
                  final SharedPreferences prefs = await SharedPreferences.getInstance();
                  prefs.setString('expectedTime',
                      expectedTime.toIso8601String());
                  Get.back();
                })
              ].toColumn(),
            )
                .decorated(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                )
                .marginAll(15);
          })
    ].toColumn(mainAxisAlignment: MainAxisAlignment.center));
  }

  aboutExpectedUS(BuildContext context) async {
    var info = await PackageInfo.fromPlatform();
    showAboutDialog(
      applicationName: info.appName,
      applicationVersion: info.version,
      applicationIcon: Image.asset(
        'assets/launcher.webp',
        width: 74,
        height: 74,
      ),
      children: [
        const Text("""We can provide you with pregnancy records"""),
      ],
      context: context,
    );
  }
}
