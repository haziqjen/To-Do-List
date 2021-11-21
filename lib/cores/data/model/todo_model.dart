import 'package:hive/hive.dart';

part 'todo_model.g.dart';

@HiveType(typeId: 0)
class ToDoModel  extends HiveObject{

  @HiveField(0)
  late int id;

  @HiveField(1)
  late String title;

  @HiveField(2)
  late String startDate;

  @HiveField(3)
  late String endDate;

  @HiveField(4)
  late bool isComplete;

  @HiveField(5)
  late String status;

  @HiveField(6)
  late String timeLeft;

  @override
  String toString() {
    return title;
  }

  ToDoModel({
    required this.id,
    required this.title,
    required this.startDate,
    required this.endDate,
    required this.isComplete,
    required this.status,
    required this.timeLeft
  });
}