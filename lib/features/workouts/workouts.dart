import 'package:fitnow_trainee/features/workouts/exercises.dart';
import 'package:fitnow_trainee/shared/project_colors/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Workouts extends StatefulWidget {
  const Workouts({Key? key}) : super(key: key);

  @override
  State<Workouts> createState() => _WorkoutsState();
}

class _WorkoutsState extends State<Workouts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Workout First Program",
          style: TextStyle(color: ProjectColors.green_color),
        ),
        backgroundColor: Colors.grey[400],
        centerTitle: true,
        foregroundColor: Colors.grey[700],
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: CircleAvatar(
              radius: 20.0,
              backgroundImage: AssetImage('assets/images/my_photo.jpg'),
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("assets/images/a.png"),
              SizedBox(
                height: 20,
              ),
              TextButton(onPressed: (){Get.to(Exercises());},
                child: Container(
                  decoration:
                      BoxDecoration(color: Colors.white, border: Border()),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "1 Workout Day",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[700]),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Back Workout",
                              style: TextStyle(color: Colors.grey[700],fontWeight: FontWeight.bold,fontSize: 16),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(

                    children: [
                      TextButton(
                        onPressed: () {
                          Get.to(Workouts());
                        },
                        child: Text(
                          "Add New Workout Day",
                          style: TextStyle(
                              color: Colors.grey[700],

                              fontSize: 18),
                        ),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
