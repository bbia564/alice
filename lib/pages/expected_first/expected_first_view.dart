import 'package:expected_date/main.dart';
import 'package:expected_date/pages/expected_first/first_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'expected_first_logic.dart';

class ExpectedFirstPage extends GetView<ExpectedFirstLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: GetBuilder<ExpectedFirstLogic>(
                init: ExpectedFirstLogic(),
                builder: (_) {
                  return SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: <Widget>[
                      <Widget>[
                        Image.asset(
                          'assets/bg.webp',
                          width: double.infinity,
                          height: 254,
                          fit: BoxFit.cover,
                        ),
                        const Positioned(
                            top: 22,
                            left: 22,
                            child: Text(
                              'Hi',
                              style: TextStyle(fontSize: 12),
                            )),
                        const Positioned(
                            top: 42,
                            left: 22,
                            child: Text(
                              'Alice',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )),
                        Positioned(
                            bottom: 22,
                            right: 22,
                            child: Text(
                              'Week ${controller.weekNum}',
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )),
                      ].toStack(),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        child: <Widget>[
                          <Widget>[
                            const Text('Gestation'),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Distance from due date: ${controller.expectedTime.difference(DateTime.now()).inDays} days',
                              style: const TextStyle(
                                  fontSize: 12, color: Color(0xff6c6c6c)),
                            )
                          ].toRow(),
                          <Widget>[
                            Container(
                              width: double.infinity,
                              height: 10,
                            ).decorated(
                                color: const Color(0xffebebeb),
                                borderRadius: BorderRadius.circular(5)),
                            LayoutBuilder(builder: (_, max) {
                              return Container(
                                      width: max.maxWidth / 2, height: 10)
                                  .decorated(
                                      color: primaryColor,
                                      borderRadius: BorderRadius.circular(5));
                            })
                          ].toStack().marginSymmetric(vertical: 8),
                          <Widget>[
                            const Text(
                              'Week 0',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                            Text(
                              'Week ${controller.weekNum}',
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.grey),
                            ),
                            const Text(
                              'Expected date',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                            )
                          ].toRow(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween),
                        ].toColumn(
                            crossAxisAlignment: CrossAxisAlignment.start),
                      )
                          .decorated(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15))
                          .marginSymmetric(vertical: 15),
                      FirstItem(controller.list.value)
                    ].toColumn(),
                  );
                }).marginAll(15)),
      ),
    );
  }
}
