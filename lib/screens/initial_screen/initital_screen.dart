import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/cores/routes/route_names.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  _InitialScreenState createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
         color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              Image.asset('assets/images/initial_asset.png'),
              const SizedBox(height: 20,),
              Text('Welcome !',
                  style: TextStyle(
                    fontFamily: 'Bulo Rounded Medium',
                      fontSize: Get.width * 0.062,
                      fontWeight: FontWeight.w500)),
              const SizedBox(height: 15.0),
              Text('To-Do List',
                  style: TextStyle(
                      fontFamily: 'Bulo Rounded Medium',
                      fontSize: Get.width * 0.103,
                      fontWeight: FontWeight.w600)),

              SizedBox(height: Get.height * 0.01),
              Text(
                'Mobile App Developer Assessment',
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: Get.width * 0.0415, fontWeight: FontWeight.w300),
              ),
              SizedBox(height: Get.height * 0.05),
              const Align(
                  alignment: Alignment.bottomRight,
                  child: NextButton()),
              SizedBox(height: Get.height * 0.15),
            ],
          ),
        ),
      ),
    );
  }
}

class NextButton extends StatelessWidget {
  const NextButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: Colors.grey.shade300, spreadRadius: 0, blurRadius: 6)
      ], shape: BoxShape.circle, color: Theme.of(context).primaryColor),
      child: FittedBox(
        child: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () => Get.offNamed(RouteName.HOME_SCREEN),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.arrow_forward, color: Colors.white),
          ),
        ),
      ),
    );
  }
}