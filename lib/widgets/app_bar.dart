import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppToolbar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;
  final String title;
  final bool hasBackBtn;
  const AppToolbar(
      {Key? key,
      required this.appBar,
      required this.title,
      required this.hasBackBtn})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: hasBackBtn
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
              onPressed: () => Get.back(),
            )
          : null,
      backgroundColor: Theme.of(context).primaryColor,
      title: Text(
        title,
        textAlign: TextAlign.start,
        style: TextStyle(
          fontSize: Get.height * 0.03,
          color: Colors.black,
          fontFamily: 'Bulo Rounded Bold',
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
