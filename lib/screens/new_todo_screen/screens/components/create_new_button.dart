import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/cores/local_db/local_db_services.dart';
import 'package:to_do_list/screens/new_todo_screen/controllers/new_todo_screen_controller.dart';

class CreateNewButton extends GetView<NewToDoScreenController> {
  const CreateNewButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.saveToDo(context, false);
      },
      child: Container(
        width: Get.width,
        height: Get.height * 0.08,
        decoration: const BoxDecoration(color: Colors.black),
        child: Center(
            child: Text(
          controller.getButtonTitle(),
          style: TextStyle(
              color: Colors.white,
              fontSize: Get.height * 0.028,
              fontWeight: FontWeight.w300),
        )),
      ),
    );
  }
}
