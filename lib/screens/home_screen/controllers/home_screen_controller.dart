import 'dart:async';

import 'package:date_count_down/countdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:to_do_list/constants/constant.dart';
import 'package:to_do_list/cores/data/model/todo_model.dart';
import 'package:to_do_list/cores/local_db/local_db_services.dart';

class HomeScreenController extends GetxController {
  var scrollController = ScrollController();
  final localDbService = Get.find<LocalDBService>();
  late Box<ToDoModel> todoBox;
  final loading = true.obs;
  List<ToDoModel> todoData = <ToDoModel>[];
  late Timer timer;
  final isCompletedTick = false.obs;
  final showFab = true.obs;

  @override
  void onInit() {
    super.onInit();
    getBox();
    initScrollController();
    timer = Timer.periodic(
        const Duration(seconds: 10), (Timer t) => getTimeLeft(todoBox));
  }

  Future<void> getBox() async {
    todoBox = await Hive.openBox<ToDoModel>(ConstantValue.databaseName);
    loading.value = false;
  }

  Future<List<ToDoModel>> getData() async {
    todoData = await localDbService.getAllToDoList();
    loading.value = false;
    return todoData;
  }

  void getTimeLeft(Box<ToDoModel> todoBox) {
    loading.value = true;
    for (ToDoModel toDo in todoBox.values) {
      DateTime endDate = DateTime.parse(toDo.endDate);
      Duration differenceDuration = endDate.difference(DateTime.now());

      if (toDo.isComplete) {
        toDo.timeLeft = " - ";
      } else {
        if (differenceDuration.inMinutes.remainder(60) < 0) {
          toDo.timeLeft = " - ";
        } else {
          toDo.timeLeft =
              "${differenceDuration.inHours} hrs ${differenceDuration.inMinutes.remainder(60)} min";
        }
      }
    }

    loading.value = false;
  }

  void initScrollController() {
    scrollController.addListener(() {
      if (showFab.value) {
        if (scrollController.position.pixels.round() > 140) {
          showFab.value = false;
        }
      } else {
        if (scrollController.position.pixels.round() <= 140) {
          showFab.value = true;
        }
      }
    });
  }

  String reformatDate(String date){
    DateTime originalDate = DateTime.parse(date);
    return DateFormat('dd MMM yyyy').format(originalDate);
  }
}
