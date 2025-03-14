import 'package:expected_date/db_expected/db_expected.dart';
import 'package:expected_date/pages/expected_second/expected_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../db_expected/expected_entity.dart';
import '../../main.dart';

class ExpectedSecondLogic extends GetxController {
  DBExpected dbExpected = Get.find();

  CalendarFormat calendarFormat = CalendarFormat.month;

  var list = <ExpectedEntity>[];
  var currentDate = DateTime.now();

  void getData() async {
    list = await dbExpected.getWriteTimeAllData(currentDate);
    update();
  }

  void addData() {
    var content = '';
    Get.bottomSheet(Container(
      width: double.infinity,
      height: 400,
      child: SafeArea(
          child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: <Widget>[
          const Align(alignment: Alignment.center, child: Text('Add record')),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'Date',
            style: TextStyle(fontSize: 14, color: Colors.black45),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            height: 50,
            child: IgnorePointer(
              child: ExpectedTextField(
                  textAlign: TextAlign.center,
                  value: DateFormat('yyyy/MM/dd').format(currentDate),
                  onChange: (v) {}),
            ),
          ).decorated(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade300)),
          const SizedBox(
            height: 15,
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            child: ExpectedTextField(
                hintText: 'Add record',
                maxLength: 200,
                maxLines: 6,
                value: content,
                onChange: (v) {
                  content = v;
                }),
          ).decorated(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade300)),
          const SizedBox(
            height: 15,
          ),
          Container(
            width: double.infinity,
            height: 50,
            alignment: Alignment.center,
            child: const Text(
              'Commit',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
          )
              .decorated(
                  color: primaryColor, borderRadius: BorderRadius.circular(15))
              .marginSymmetric(vertical: 15)
              .gestures(onTap: () async {
            if (content.isEmpty) {
              Fluttertoast.showToast(msg: 'Please enter the content');
              return;
            } else {
              await dbExpected.insertExpected(ExpectedEntity(
                id: 0,
                createdTime: DateTime.now(),
                writeTime: currentDate,
                content: content,
              ));
              Get.back();
              Fluttertoast.showToast(msg: 'Added successfully');
              getData();
            }
          }),
        ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
      ).marginAll(15)),
    ).decorated(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20))));
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }
}
