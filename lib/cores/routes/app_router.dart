import 'package:get/get.dart';
import 'package:to_do_list/screens/home_screen/bindings/home_screen_binding.dart';
import 'package:to_do_list/screens/home_screen/screen/home_screen.dart';
import 'package:to_do_list/screens/initial_screen/initital_screen.dart';
import 'package:to_do_list/screens/new_todo_screen/bindings/new_todo_screen_binding.dart';
import 'package:to_do_list/screens/new_todo_screen/screens/new_todo_screen.dart';
import 'route_names.dart';

class Routes {
  static final router = [
    GetPage(name: RouteName.INITIAL_SCREEN, page: () => const InitialScreen()),
    GetPage(
        name: RouteName.HOME_SCREEN,
        page: () => const HomeScreen(),
        binding: HomeScreenBinding()),
    GetPage(
        name: RouteName.ADD_NEW_TODO_SCREEN,
        page: () => const NewToDoScreen(),
        binding: NewToDoScreenBinding()),
  ];
}
