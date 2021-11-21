import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/screens/new_todo_screen/controllers/new_todo_screen_controller.dart';
import 'package:to_do_list/screens/new_todo_screen/screens/components/create_new_button.dart';
import 'package:to_do_list/screens/new_todo_screen/screens/components/end_date_input.dart';
import 'package:to_do_list/screens/new_todo_screen/screens/components/start_date_input.dart';
import 'package:to_do_list/screens/new_todo_screen/screens/components/todo_title_input.dart';
import 'package:to_do_list/widgets/app_bar.dart';

class NewToDoScreen extends GetView<NewToDoScreenController> {
  const NewToDoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppToolbar(
            appBar: AppBar(), title: 'Add new To-Do List', hasBackBtn: true),
        body: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              SizedBox(height: 20),
              ToDoTitleInput(),
              SizedBox(height: 20),
              StartDateInput(),
              SizedBox(height: 20),
              EndDateInput(),
              Spacer(),
              CreateNewButton()
            ],
          ),
        ),
      ),
    );
  }
}
