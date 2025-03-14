import 'package:expected_date/db_expected/expected_entity.dart';
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:get/get.dart';

class FirstItem extends StatelessWidget {
  const FirstItem(this.list, {Key? key}) : super(key: key);
  final List<ExpectedEntity> list;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      child: <Widget>[
        const Text(
          'Pregnancy record',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        list.isEmpty
            ? const Center(child: Text('No data'))
            : ListView.builder(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: list.length,
                itemBuilder: (_, index) {
                  final entity = list[index];
                  return Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(12),
                          child: <Widget>[
                            Text(
                              entity.writeTimeString,
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.grey),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              entity.content,
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ].toColumn(
                              crossAxisAlignment: CrossAxisAlignment.start))
                      .decorated(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey.shade200))
                      .marginOnly(bottom: 10);
                })
      ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
    ).decorated(color: Colors.white, borderRadius: BorderRadius.circular(20));
  }
}
