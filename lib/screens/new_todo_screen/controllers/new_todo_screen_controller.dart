import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:to_do_list/constants/constant.dart';
import 'package:to_do_list/cores/data/model/todo_model.dart';
import 'package:to_do_list/cores/local_db/local_db_services.dart';

class NewToDoScreenController extends GetxController {
  FocusNode toDoTitleFocusNode = FocusNode();
  TextEditingController toDoTitleController = TextEditingController();
  LocalDBService localDBService = LocalDBService();
  var formatter = DateFormat('yyyy-MM-dd');
  final startDateString = ''.obs;
  final endDateString = ''.obs;
  final toDoTitleIsEmpty = true.obs;
  late ToDoModel toDoModel;
  late int indexToUpdate;

  @override
  void onInit() {
    super.onInit();
    updateView();
  }

  void updateView() {
    if (Get.arguments['todo'] != null) {
      toDoModel = Get.arguments['todo'];
      indexToUpdate = Get.arguments['index'];
      toDoTitleController.text = toDoModel.title;
      startDateString.value = toDoModel.startDate;
      endDateString.value = toDoModel.endDate;
    }
  }

  Future<void> pickDate(BuildContext context, bool isStartDate) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2022, 12),
        builder: (BuildContext context, Widget? child) {
          return Theme(
              data: ThemeData.light().copyWith(
                colorScheme: ColorScheme.fromSwatch(
                  primarySwatch: Colors.amber,
                  primaryColorDark: Colors.amber,
                  accentColor: Colors.amber,
                ),
                dialogBackgroundColor: Colors.white,
              ),
              child: child!);
        });

    if (picked != null) {
      if (isStartDate) {
        startDateString.value = formatter.format(picked);
      } else {
        endDateString.value = formatter.format(picked);
      }
    }
  }

  Future<void> saveToDo(BuildContext context, bool isCompleted) async {
    int id = await localDBService.getToDoListSize();

    if (toDoTitleIsEmpty.isTrue ||
        startDateString.value.isEmpty ||
        endDateString.value.isEmpty) {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return CupertinoAlertDialog(
              title: const Text('To-Do List'),
              content: const Text('Oops! You didn\'t complete the form'),
              actions: [
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text('Okay'),
                ),
              ],
            );
          });
    } else {
      if (Get.arguments['todo'] != null) {
        localDBService.updateToDoList(
            toDoModel.id,
            toDoTitleController.value.text,
            startDateString.value,
            endDateString.value,
            toDoModel.status,
            toDoModel.isComplete,
            indexToUpdate);
      } else {
        localDBService.saveToDoList(id, toDoTitleController.value.text,
            startDateString.value, endDateString.value, 'Incomplete', false);
      }

      Get.back();
    }
  }

  String getButtonTitle(){
    String title;
    if(Get.arguments['todo'] != null){
      title = "Update Now";
    }else{
      title = "Create New";
    }
    return title;
  }
}
