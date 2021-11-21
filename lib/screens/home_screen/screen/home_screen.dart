import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/constants/constant.dart';
import 'package:to_do_list/cores/data/model/todo_model.dart';
import 'package:to_do_list/cores/routes/route_names.dart';
import 'package:to_do_list/screens/home_screen/controllers/home_screen_controller.dart';
import 'package:to_do_list/screens/home_screen/screen/components/floating_action_btn.dart';
import 'package:to_do_list/screens/home_screen/screen/components/todo_list_card.dart';
import 'package:to_do_list/widgets/app_bar.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantValue.backgroundColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: const CustomFloatingActionButton(),
      appBar: AppToolbar(appBar: AppBar(), title: 'To-Do List', hasBackBtn: false),
      body: Container(
        height: Get.height,
        width: Get.width,
        child:  Obx(()=> controller.loading.isTrue ? Container() :
            ValueListenableBuilder(
              valueListenable: controller.todoBox.listenable(),
              builder:(context, Box<ToDoModel> todos, _) {
                return ListView.builder(
                  controller: controller.scrollController,
                  itemCount: todos.values.length,
                    itemBuilder: (context, index){
                  return ToDoListCard(
                    index, todos
                  );
                });}
            ),
        ),
          ),
        );
  }
}
