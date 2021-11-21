import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:to_do_list/constants/constant.dart';
import 'package:to_do_list/cores/data/model/todo_model.dart';
import 'package:to_do_list/cores/routes/route_names.dart';
import 'package:to_do_list/screens/home_screen/controllers/home_screen_controller.dart';

class ToDoListCard extends GetView<HomeScreenController> {

   final int index;
   final Box<ToDoModel> todos;

  const ToDoListCard(this.index, this.todos, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>Get.toNamed(RouteName.ADD_NEW_TODO_SCREEN, arguments: {'todo':todos.values.elementAt(index), 'index' : index}),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          width: Get.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      todos.values.elementAt(index).title,
                      style: TextStyle(
                        fontSize: Get.height * 0.03,
                        color: Colors.black,
                        fontFamily: 'Bulo Rounded Bold',
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Start Date',
                              style: TextStyle(
                                fontSize: Get.height * 0.015,
                                color: Colors.black,
                                fontFamily: 'Bulo Rounded Medium',
                              ),
                            ),
                            Text(
                              controller.reformatDate(todos.values.elementAt(index).startDate),
                              style: TextStyle(
                                fontSize: Get.height * 0.02,
                                color: Colors.black,
                                fontFamily: 'Bulo Rounded Bold',
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'End Date',
                              style: TextStyle(
                                fontSize: Get.height * 0.015,
                                color: Colors.black,
                                fontFamily: 'Bulo Rounded Medium',
                              ),
                            ),
                            Text(
                              controller.reformatDate(todos.values.elementAt(index).endDate),
                              style: TextStyle(
                                fontSize: Get.height * 0.02,
                                color: Colors.black,
                                fontFamily: 'Bulo Rounded Bold',
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Time Left',
                              style: TextStyle(
                                fontSize: Get.height * 0.015,
                                color: Colors.black,
                                fontFamily: 'Bulo Rounded Medium',
                              ),
                            ),
                            SizedBox(
                              width: Get.width*0.25,
                              child: Text(
                                todos.values.elementAt(index).timeLeft,
                                style: TextStyle(
                                  fontSize: Get.height * 0.02,
                                  color: Colors.black,
                                  fontFamily: 'Bulo Rounded Bold',
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: const BoxDecoration(
                      color: ConstantValue.cardSecondaryColor,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10))),
                  child: Padding(
                    padding: const EdgeInsets.only(left :12.0),
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Status',
                              style: TextStyle(
                                fontSize: Get.height * 0.015,
                                color: Colors.black,
                                fontFamily: 'Bulo Rounded Medium',
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              todos.values.elementAt(index).status,
                              style: TextStyle(
                                fontSize: Get.height * 0.02,
                                color: Colors.black,
                                fontFamily: 'Bulo Rounded Bold',
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Text(
                          'Tick if completed',
                          style: TextStyle(
                            fontSize: Get.height * 0.02,
                            color: Colors.black,
                            fontFamily: 'Bulo Rounded Bold',
                          ),
                        ),
                        Checkbox(
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            checkColor: Colors.lightGreen,
                              value: todos.values.elementAt(index).isComplete,
                              onChanged: (bool? value){

                              controller.localDbService.updateToDoList(
                                  todos.values.elementAt(index).id,
                                  todos.values.elementAt(index).title,
                                  todos.values.elementAt(index).startDate,
                                  todos.values.elementAt(index).endDate,
                                  value == true ? 'Completed' : 'Incomplete',
                                  value!,
                                  index);

                          })
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
