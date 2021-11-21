import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/screens/new_todo_screen/controllers/new_todo_screen_controller.dart';

class StartDateInput extends GetView<NewToDoScreenController> {
  const StartDateInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
        child: Text('Start Date',
            style: TextStyle(
                fontSize: Get.height * 0.028, fontWeight: FontWeight.w300)),
      ),
      GestureDetector(
        onTap: (){
          controller.pickDate(context, true);
          FocusScope.of(context).unfocus();
        },
        child: Container(
            width: Get.width * 0.8,
            decoration:
                BoxDecoration(border: Border.all(color: Colors.grey.shade300)),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Obx(
                    () => controller.startDateString.isEmpty
                        ? Text(
                            'Select a date',
                            style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: Get.width * 0.045),
                          )
                        : Text(
                            controller.startDateString.value,
                            style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: Get.width * 0.045),
                          ),
                  ),
                  const Spacer(),
                  const Icon(Icons.keyboard_arrow_down)
                ],
              ),
            )),
      ),
    ]);
  }
}
