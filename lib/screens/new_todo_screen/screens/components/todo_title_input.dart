import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/screens/new_todo_screen/controllers/new_todo_screen_controller.dart';

class ToDoTitleInput extends GetView<NewToDoScreenController> {
  const ToDoTitleInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
        child: Text('To-Do Title',
            style: TextStyle(
                fontSize: Get.height * 0.028, fontWeight: FontWeight.w300)),
      ),
      SizedBox(
          width: Get.width * 0.8,
          child: TextField(
              onChanged: (String value) {
                if (value.isNotEmpty && value.length > 3) {
                  controller.toDoTitleIsEmpty.value = false;
                } else {
                  controller.toDoTitleIsEmpty.value = true;
                }
              },
            maxLines: 5,
              focusNode: controller.toDoTitleFocusNode,
              controller: controller.toDoTitleController,
              decoration: InputDecoration(
                hintText: 'Please key in your To-Do title here',
                hintStyle: TextStyle(
                    color: Colors.grey[400], fontSize: Get.width * 0.045),
                isDense: true,
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade300)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade300)),
              ),
            ),
          ),
    ]);
  }
}
