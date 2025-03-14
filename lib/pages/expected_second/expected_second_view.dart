import 'package:expected_date/main.dart';
import 'package:expected_date/pages/expected_first/first_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:table_calendar/table_calendar.dart';

import 'expected_second_logic.dart';

class ExpectedSecondPage extends GetView<ExpectedSecondLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pregnancy record')),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: GetBuilder<ExpectedSecondLogic>(
                init: ExpectedSecondLogic(),
                builder: (_) {
                  return SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: <Widget>[
                      TableCalendar(
                        firstDay: DateTime.utc(2011, 10, 16),
                        lastDay: DateTime.utc(2030, 3, 14),
                        focusedDay: DateTime.now(),
                        calendarFormat: controller.calendarFormat,
                        onFormatChanged: (format) {
                          if (controller.calendarFormat != format) {
                            controller.calendarFormat = format;
                            controller.update();
                          }
                        },
                        currentDay: controller.currentDate,
                        calendarStyle: const CalendarStyle(
                          todayDecoration: BoxDecoration(
                              color: Color(0xffff93da), shape: BoxShape.circle),
                        ),
                        onDaySelected: (selectedDay, focusedDay) {
                          controller.currentDate = selectedDay;
                          controller.update();
                          controller.getData();
                        },
                      ),
                      Container(
                        width: double.infinity,
                        height: 50,
                        alignment: Alignment.center,
                        child: const Text(
                          'Add record',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      )
                          .decorated(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(15))
                          .marginSymmetric(vertical: 15)
                          .gestures(onTap: () {
                            controller.addData();
                      }),
                      FirstItem(controller.list)
                    ].toColumn(),
                  );
                }).marginAll(15)),
      ),
    );
  }
}
