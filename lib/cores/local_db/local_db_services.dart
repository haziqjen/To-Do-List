import 'package:hive/hive.dart';
import 'package:get/get.dart';
import 'package:to_do_list/constants/constant.dart';
import 'package:to_do_list/cores/data/model/todo_model.dart';

class LocalDBService extends GetxController {
  late Box<ToDoModel> todoBox;

  @override
  void onInit() {
    super.onInit();
    initService();

  }

  void initService() async {
    todoBox = await Hive.openBox<ToDoModel>(ConstantValue.databaseName);
  }

  Future<Box<ToDoModel>> getBox() async{
    return await Hive.openBox<ToDoModel>(ConstantValue.databaseName);
}

  void saveToDoList(int id, String title, String startDate, String endDate,
      String status, bool isComplete) async {
    todoBox = await Hive.openBox<ToDoModel>(ConstantValue.databaseName);
    ToDoModel toDoModel = ToDoModel(
        id: id,
        title: title,
        startDate: startDate,
        endDate: endDate,
        isComplete: isComplete,
        status: status,
        timeLeft: 'Calculating..'
    );
    todoBox.add(toDoModel);
  }

  void updateToDoList(int id, String title, String startDate, String endDate,
      String status, bool isComplete, int index) async {
    todoBox = await Hive.openBox<ToDoModel>(ConstantValue.databaseName);
    ToDoModel toDoModel = ToDoModel(
        id: id,
        title: title,
        startDate: startDate,
        endDate: endDate,
        isComplete: isComplete,
        status: status,
        timeLeft: 'Calculating..'
    );
    todoBox.putAt(index, toDoModel);
  }

  Future<int> getToDoListSize() async{
    todoBox = await Hive.openBox<ToDoModel>(ConstantValue.databaseName);
    return todoBox.isEmpty ? 0 : todoBox.length;
  }

  Future<List<ToDoModel>> getAllToDoList() async {
    todoBox = await Hive.openBox<ToDoModel>(ConstantValue.databaseName);
    List<ToDoModel> data = <ToDoModel>[];
    data.addAll(todoBox.values);

    return data;
  }
}
