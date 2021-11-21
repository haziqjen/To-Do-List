import 'package:get/get.dart';
import 'package:to_do_list/screens/home_screen/controllers/home_screen_controller.dart';

class HomeScreenBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HomeScreenController());
  }

}