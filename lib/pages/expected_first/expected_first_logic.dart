import 'package:expected_date/db_expected/db_expected.dart';
import 'package:expected_date/db_expected/expected_entity.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExpectedFirstLogic extends GetxController {

  DBExpected dbExpected = Get.find<DBExpected>();

  var list = <ExpectedEntity>[].obs;

  DateTime expectedTime = DateTime.now();
  int weekNum = 0;

  void getData() async {
    list.value = await dbExpected.getExpectedAllData();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('expectedTime') != null) {
      expectedTime = DateTime.parse(prefs.getString('expectedTime')!);
    }
    final pregnantTime = expectedTime.subtract(const Duration(days: 40*7));
    weekNum = (DateTime.now().difference(pregnantTime).inDays / 7).floor();
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }

}
