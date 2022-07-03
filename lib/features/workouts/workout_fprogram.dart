import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:fitnow_trainee/shared/project_colors/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:fitnow_trainee/controller/cubit/coach_packages_controller/coach_packages_cubit.dart';
import 'package:fitnow_trainee/features/workouts/Workout_days.dart';
import 'package:fitnow_trainee/features/workouts/exercise_details.dart';
import 'package:fitnow_trainee/features/workouts/workout_details.dart';
import 'package:fitnow_trainee/shared/project_colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controller/cubit/payment/payment_states.dart';
import '../../controller/cubit/trainee_programs/programs_cubit.dart';
import '../../controller/cubit/trainee_programs/programs_states.dart';
import 'exercises.dart';
import '../login&register/settings.dart';
import 'workout_details.dart';
import 'workouts.dart';

class WorkoutFirstProgram extends StatefulWidget {
  const WorkoutFirstProgram({Key? key}) : super(key: key);

  @override
  State<WorkoutFirstProgram> createState() => _WorkoutFirstProgramState();
}

class _WorkoutFirstProgramState extends State<WorkoutFirstProgram> {
  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    DateTime now = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Workout First Program",
          style: TextStyle(color: ProjectColors.green_color),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[400],
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              icon: Icon(Icons.settings),
              onPressed: (){
                Get.to(LogoutScreen());},

              color: ProjectColors.dark_grey_color,
            ),
          )
        ],
      ),
      body: BlocProvider(
        create: (BuildContext context) => ProgramsCubit(),
        child: BlocConsumer<ProgramsCubit, Programstates>(
            builder: (context, state) {
              return ConditionalBuilder(
                condition: ProgramsCubit.model!=null,
                fallback: (context) => Center(child: CircularProgressIndicator()),
                builder: (context) => Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: RefreshIndicator(
                          onRefresh: refresh,
                          child: ListView.builder(
                              itemCount: ProgramsCubit.model.data.program.weeks,
                              itemBuilder: (context, index) =>Container(


                                width: double.infinity,

                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Container(

                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                border: Border.all(color: ProjectColors.green_color),
                                                color: ProjectColors.green_color,
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                              child: TextButton(
                                                onPressed: ()async{
                                                  SharedPreferences prefs =await SharedPreferences.getInstance();
                                                  prefs.setInt("weeks",ProgramsCubit.model.data.program.weeks );
                                                  prefs.setInt("weeks_index",index);

                                                  WorkoutDays.getweeks();
                                                  Get.to(WorkoutDays());
                                                },
                                                child: Container(
                                                  child: Text(
                                                    "week "+ (index+1).toString() ,
                                                    textAlign:
                                                    TextAlign.center,
                                                    style: TextStyle(
                                                        fontWeight:
                                                        FontWeight.bold,color: ProjectColors.white_color),
                                                  ),
                                                ),
                                              )),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),

                                  ],
                                ),
                              ) ),
                        ),
                      ),

                    ],
                  ),
                ),
              );
            }, listener: (context, state) async {


        }),
      ),
    );
  }

  Future<void> refresh()async {
    setState(() {
      ProgramsCubit pc=new ProgramsCubit();
      pc.getprogram();
    });
  }
}
