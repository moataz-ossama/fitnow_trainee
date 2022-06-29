// @dart=2.9
import 'package:email_validator/email_validator.dart';
import 'package:fitnow_trainee/controller/cubit/trainee_programs/programs_cubit.dart';
import 'package:fitnow_trainee/features/workouts/exercise_details.dart';
import 'package:fitnow_trainee/features/workouts/workout_details.dart';
import 'package:fitnow_trainee/shared/project_colors/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'exercise_sets.dart';

class Exercises extends StatefulWidget {
  const Exercises({Key key}) : super(key: key);
  static int id;
static getdata()async{
  SharedPreferences sharedpref =
  await SharedPreferences
      .getInstance();

  id=sharedpref.getInt("day_id");
  print("day id in ex is"+id.toString());
}

  @override
  State<Exercises> createState() => _ExercisesState();
}

class _ExercisesState extends State<Exercises> {


  var x =Exercises.getdata();
  int day_id=Exercises.id;
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

        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Workout Day "+  (day_id+1).toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[700]),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              flex: 5,
              child: ListView.builder(
                itemCount: ProgramsCubit.model.data.program.days[day_id].workout.workoutExercieses.length,
                itemBuilder: (context, index) =>  Column(
                  children: [
                    TextButton(
                      onPressed: ()async{

                          SharedPreferences sharedpref =
                              await SharedPreferences
                              .getInstance();
                          sharedpref.setInt('exercise_id', index);

                          Get.to(ExerciseSets());


                      },
                      child: Row(
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
                                      ProgramsCubit.model.data.program.days[day_id].workout.workoutExercieses[index].details.title
                                          !=null? ProgramsCubit.model.data.program.days[day_id].workout.workoutExercieses[index].details.title
                                          :"no exercises",
                                      style: TextStyle(
                                        color: Colors.grey[600],
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
