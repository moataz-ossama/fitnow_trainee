import 'package:fitnow_trainee/features/login&register/update_profile.dart';
import 'package:fitnow_trainee/features/login&register/view_profile.dart';
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
  DateTime date =DateTime(2022,12,4);
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                  color: ProjectColors.green_color,
                  border: Border.all(color: ProjectColors.green_color),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextButton(
                    onPressed: ()  {
print("date= "+ date.toString());
                  Get.to(ViewProfile());


                    },
                    child: Text("View Profile",style: TextStyle(color: ProjectColors.white_color),)),
              ),
              SizedBox(height: 20,),

              Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                  color: ProjectColors.green_color,
                  border: Border.all(color: ProjectColors.green_color),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextButton(
                    onPressed: ()  {
                      print("date= "+ date.toString());
                      Get.to(UpdateProfile());


                    },
                    child: Text("Update Profile",style: TextStyle(color: ProjectColors.white_color),)),
              ),
              SizedBox(height: 20,),


              Container(
                height: 50,
                width: 200,
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
                    child: Text("log out",style: TextStyle(color: ProjectColors.white_color))),
              ),
            ],
          ),
        ));
  }
}
