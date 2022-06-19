import 'package:fitnow_trainee/features/workouts/exercise_details.dart';
import 'package:fitnow_trainee/features/workouts/workout_details.dart';
import 'package:fitnow_trainee/shared/project_colors/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Exercises extends StatelessWidget {
  const Exercises({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Exercises",
          style: TextStyle(color: ProjectColors.green_color),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[300],
        foregroundColor: Colors.grey[600],
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextButton(
              onPressed: () {},
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
                            style: TextStyle(
                                color: Colors.grey[700],
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              flex: 5,
              child: ListView.builder(
                itemBuilder: (context, index) =>  Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 70,
                            width: 70,
                            child: Image.asset("assets/images/barbell.png"),
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: ProjectColors.white_color),
                          ),
                        ),
                        Expanded(
                            flex: 4,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 40.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Barbell Pullover And Press",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Divider(
                                    color: Colors.grey[200],
                                    height: 5,
                                    thickness: 1,
                                  ),
                                ],
                              ),
                            ))
                      ],
                    ),

                  ],
                ),

              ),
            ),

            Expanded(

              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: (){}, child:     Container(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {
Get.to(ExerciseDetails());
                      },
                      child: Text(
                        "Begin Workout",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                    height: 40,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.green),
                        color: ProjectColors.green_color,
                        borderRadius: BorderRadius.circular(5)),
                  ) ),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
