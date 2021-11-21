import 'package:flutter/material.dart';
import 'package:to_do_list/constants/constant.dart';
import 'package:to_do_list/cores/routes/route_names.dart';
import 'package:get/get.dart';
import 'package:to_do_list/screens/home_screen/controllers/home_screen_controller.dart';

class CustomFloatingActionButton extends GetView<HomeScreenController> {
  const CustomFloatingActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Visibility(
        visible: controller.showFab.value,
        child: FloatingActionButton(
          onPressed: () => Get.toNamed(RouteName.ADD_NEW_TODO_SCREEN, arguments: {'todo' : null, 'index' : null}),
          backgroundColor: ConstantValue.fabColor,
          splashColor: ConstantValue.primaryColor,
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }
}
