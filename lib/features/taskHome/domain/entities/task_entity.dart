import 'package:equatable/equatable.dart';

class TaskEntity extends Equatable {
  TaskEntity({
    required this.id,
    required this.title,
    required this.tag,
    required this.createdAt,
  });

  final int id;
  final String title;
  final String tag;
  final DateTime createdAt;

  factory TaskEntity.empty() =>
      TaskEntity(id: 0, title: '', tag: '', createdAt: DateTime.now());

  @override
  // TODO: implement props
  List<Object?> get props => [id, title, tag, createdAt];
}
