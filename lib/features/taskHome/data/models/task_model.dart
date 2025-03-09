import 'dart:convert';

import 'package:todo_flutter/features/taskHome/domain/entities/task_entity.dart';

class TaskModel extends TaskEntity {
  TaskModel({
    required super.id,
    required super.title,
    required super.tag,
    required super.createdAt,
  });
// this method is used to convert a map to a TaskModel object
  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      // this line means that the key of the map is the same
      // as the name of the variable in the class TaskModel
      title: map['title'] as String,
      tag: map['tag'] as String,
      createdAt: DateTime.parse(map['createdAt'] as String),
      id: int.parse(map['id'] as String),
    );
  }
  factory TaskModel.fromJson(String jsonString) {
    final json = jsonDecode(jsonString);
  return TaskModel.fromMap(json as Map<String, dynamic>);

  }
  // this method is used to convert a TaskModel object to a map
Map<String, dynamic> toMap() {
    return<String, dynamic> {
      'title': title,
      'tag': tag,
      'createdAt': createdAt.toIso8601String(),
      'id': id.toString(),
    };

}
// this method is used to convert a TaskModel object to a json
String toJson() {
    return jsonEncode(toMap());
  }
}
