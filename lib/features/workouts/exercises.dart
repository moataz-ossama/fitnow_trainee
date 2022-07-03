// @dart=2.9
import 'package:email_validator/email_validator.dart';
import 'package:fitnow_trainee/controller/cubit/coach_packages_controller/coach_packages_cubit.dart';
import 'package:fitnow_trainee/controller/cubit/exercise%20data/exercise_cubit.dart';
import 'package:fitnow_trainee/controller/cubit/trainee_programs/programs_cubit.dart';
import 'package:fitnow_trainee/features/workouts/exercise_details.dart';
import 'package:fitnow_trainee/features/workouts/workout_details.dart';
import 'package:fitnow_trainee/shared/project_colors/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../freelance/section_exercise_details.dart';
import 'exercise_sets.dart';

class Exercises extends StatefulWidget {
  const Exercises({Key key}) : super(key: key);
  static int id;

  static getdata() async {
    SharedPreferences sharedpref = await SharedPreferences.getInstance();

    id = sharedpref.getInt("day_id");
    print("day id in ex is" + id.toString());
  }

  @override
  State<Exercises> createState() => _ExercisesState();
}

class _ExercisesState extends State<Exercises> {
  var x = Exercises.getdata();
  int day_id = Exercises.id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Workout Day " + (day_id + 1).toString(),
          style: TextStyle(color: ProjectColors.green_color),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[300],
        foregroundColor: Colors.grey[600],
        actions: [],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            ProgramsCubit.model.data.program.days[day_id].workout.sections.length>0?  ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index1) =>Column(
                children: [
                  Container(
                      width: double.infinity,
                      height: 30,
                      decoration: BoxDecoration(
                          color: Colors.grey[600],
                          border: Border.all(color: Colors.grey[600])
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(ProgramsCubit.model.data.program.days[0].workout.sections[index1].title,style: TextStyle(color: Colors.grey[300]),),
                        ],
                      )),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: ProgramsCubit.model.data.program.days[0].workout.sections[index1].exercises.length,
                      itemBuilder: (context, index2) =>  Column(children: [
                        TextButton(
                          onPressed: () async {
                            SharedPreferences sharedpref =
                            await SharedPreferences.getInstance();
                            sharedpref.setInt('exercise_id', index2);
                            SectionExerciseDetails.getdata();
                       ExerciseCubit ec=new ExerciseCubit();

                       ec.getexercisedata(ProgramsCubit.model.data.program.days[day_id].workout.sections[index1].exercises[index2].exerciseId.toString());



             await Get.to(SectionExerciseDetails());
                          }

                          ,
                          child: Row(
                            children: [

                              Expanded(
                                  flex: 4,
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.only(left: 40.0),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        ProgramsCubit.model.data.program
                                            .days[day_id].workoutId ==
                                            null
                                            ? Text("no exercise")
                                            : Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text(
                                          "${ ProgramsCubit.model.data.program.days[0].workout.sections[index1].exercises[index2].details.title.toString()
                                          }",
                                          style: TextStyle(
                                                color: Colors.grey[600],
                                                fontWeight:
                                                FontWeight.w500,
                                                fontSize: 15),
                                        ),
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
                      ))
               /*
               * */
                ],
              ),
              itemCount: ProgramsCubit.model.data.program.days[0].workout.sections.length,
            ):Container(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.grey[600],
                          border: Border.all(color: Colors.grey[600])
                        ),
                        child: Center(
                          child: Text(
                            "Exercises",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.grey[300]),
                          ),
                        ),
                      ),
                    ),
                  ],
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
              child: ProgramsCubit.model.data.program.days[day_id].workout !=
                  null
                  ? ListView.builder(
                itemCount: ProgramsCubit.model.data.program.days[day_id]
                    .workout.workoutExercieses.length,
                itemBuilder: (context, index) => Column(children: [
                        TextButton(
                          onPressed: () async {
                            SharedPreferences sharedpref =
                            await SharedPreferences.getInstance();
                            sharedpref.setInt('exercise_id', index);
                            ExerciseDetails.getdata();
                            ExerciseCubit ec=new ExerciseCubit();
                            ec.getexercisedata(ProgramsCubit.model.data.program.days[index].workout.workoutExercieses[0].exerciseId.toString());

                            Get.to(ExerciseDetails());
                          }

                          ,
                          child: Row(
                            children: [

                              Expanded(
                                  flex: 4,
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.only(left: 40.0),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        ProgramsCubit.model.data.program
                                            .days[day_id].workoutId ==
                                            null
                                            ? Text("no exercise")
                                            : Text(
                                          "${ProgramsCubit.model.data.program
                                              .days[day_id].workout
                                              .workoutExercieses[index].details
                                              .primaryFocus}",
                                          style: TextStyle(
                                              color: Colors.grey[600],
                                              fontWeight:
                                              FontWeight.w500,
                                              fontSize: 15),
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
              )
                  : Center(
                  child: Row(
                    children: [
                      Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(40.0),
                            child: Container(
                              width: double.infinity,
                              height: 40,
                              child: Center(
                                  child: Text(
                                    "No Exercises For today Take a Rest",
                                    style: TextStyle(
                                        color: ProjectColors.white_color,
                                        fontWeight: FontWeight.bold),
                                  )),
                              decoration: BoxDecoration(
                                  color: ProjectColors.green_color,
                                  border: Border.all(
                                      color: ProjectColors.green_color)),
                            ),
                          )),
                    ],
                  )),
            ),


          ],
        ),
      ),
    );
  }
}
/*

 */