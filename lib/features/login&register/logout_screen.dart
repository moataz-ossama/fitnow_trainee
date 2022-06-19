import 'package:fitnow_trainee/layout/home_layout.dart';
import 'package:fitnow_trainee/shared/project_colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';

class LogoutScreen extends StatefulWidget {
  const LogoutScreen({Key? key}) : super(key: key);

  @override
  State<LogoutScreen> createState() => _LogoutScreenState();
}

class _LogoutScreenState extends State<LogoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Settings",
            style: TextStyle(color: ProjectColors.green_color),
          ),
          centerTitle: true,
          backgroundColor: Colors.grey[200],
          foregroundColor: Colors.grey[400],
        ),
        body: Center(
          child: Container(
            height: 50,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.red,
              border: Border.all(color: Colors.red),
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextButton(
                onPressed: ()  {
                  setState(() async{
                    SharedPreferences prefs =await SharedPreferences.getInstance();
                     prefs.remove('access_token').then((value)  {
                      if(value){
                      Get.offAll(LoginScreen());
                      }

                    });
                  });


                },
                child: Text("log out")),
          ),
        ));
  }
}
