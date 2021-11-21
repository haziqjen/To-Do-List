import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:to_do_list/cores/data/model/todo_model.dart';
import 'package:to_do_list/cores/local_db/local_db_services.dart';

import 'constants/theme_data.dart';
import 'cores/routes/app_router.dart';

void main() async{
  // var path = Directory.current.path;
  WidgetsFlutterBinding.ensureInitialized();
  final document = await getApplicationDocumentsDirectory();
  Hive
    ..init(document.path)
    ..registerAdapter(ToDoModelAdapter());

  Get.put(LocalDBService());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "To-Do List",
      debugShowCheckedModeBanner: false,
      getPages: Routes.router,
      routingCallback: (route) {
        log('route_to: ' + route!.current + ' from: ' + route.previous);
      },
      theme: AppTheme.light,
    );
  }
}

