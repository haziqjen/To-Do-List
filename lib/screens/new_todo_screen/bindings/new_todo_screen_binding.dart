import 'package:get/get.dart';
import 'package:to_do_list/screens/new_todo_screen/controllers/new_todo_screen_controller.dart';

class NewToDoScreenBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => NewToDoScreenController());
  }

}