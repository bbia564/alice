import 'package:intl/intl.dart';

class ExpectedEntity {
  int id;
  DateTime createdTime;
  DateTime writeTime;
  String content;

  ExpectedEntity({
    required this.id,
    required this.createdTime,
    required this.writeTime,
    required this.content,
  });

  factory ExpectedEntity.fromJson(Map<String, dynamic> json) {
    return ExpectedEntity(
      id: json['id'],
      createdTime: DateTime.parse(json['createdTime']),
      writeTime: DateTime.parse(json['writeTime']),
      content: json['content'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdTime': createdTime.toIso8601String(),
      'writeTime': writeTime.toIso8601String(),
      'content': content,
    };
  }

  String get writeTimeString => DateFormat('yyyy/MM/dd').format(writeTime);
}