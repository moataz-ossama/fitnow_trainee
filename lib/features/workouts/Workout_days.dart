// @dart=2.9
import 'package:conditional_builder/conditional_builder.dart';
import 'package:fitnow_trainee/shared/project_colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controller/cubit/trainee_programs/programs_cubit.dart';
import '../../controller/cubit/trainee_programs/programs_states.dart';
import 'exercises.dart';

class WorkoutDays extends StatefulWidget {
  const WorkoutDays({Key key}) : super(key: key);

  @override
  State<WorkoutDays> createState() => _WorkoutDaysState();
  static int weeknum;
  static int weeks_index;

  static getweeks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    weeknum = prefs.getInt('weeks');
    weeks_index = prefs.getInt('weeks_index');
  }
}

class _WorkoutDaysState extends State<WorkoutDays> {
  int daysnum() {
    int startday = WorkoutDays.weeks_index * 7;
    return startday;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "workout days", style: TextStyle(color: ProjectColors.white_color),),
        centerTitle: true,
        backgroundColor: ProjectColors.green_color,

      ),
      body: BlocProvider(
        create: (BuildContext context) => ProgramsCubit(),
        child: BlocConsumer<ProgramsCubit, Programstates>(
            builder: (context, state) {
              return ConditionalBuilder(
                condition: ProgramsCubit.model != null,
                fallback: (context) =>
                    Center(child: CircularProgressIndicator()),
                builder: (context) =>
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ListView.builder(
                                itemCount: 7,
                                itemBuilder: (context, index) =>
                                    Container(
                                      height: 100,

                                      width: double.infinity,

                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment
                                            .center,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: Container(

                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: ProjectColors
                                                              .green_color),
                                                      color: ProjectColors
                                                          .green_color,
                                                      borderRadius: BorderRadius
                                                          .circular(10),
                                                    ),
                                                    child: TextButton(
                                                      onPressed: () async {
                                                        SharedPreferences prefs = await SharedPreferences
                                                            .getInstance();
                                                        prefs.setInt("day_id",
                                                            daysnum()+ index);
Exercises.getdata();
                                                 Get.to(Exercises());

                                                      },
                                                      child: Container(
                                                        child: Text(
                                                          "day" + (daysnum() + index+1).toString(),
                                                          textAlign:
                                                          TextAlign.center,
                                                          style: TextStyle(
                                                              fontWeight:
                                                              FontWeight.bold,
                                                              color: ProjectColors
                                                                  .white_color),
                                                        ),
                                                      ),
                                                    )),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),

                                        ],
                                      ),
                                    )),
                          ),

                        ],
                      ),
                    ),
              );
            }, listener: (context, state) async {
          setState(() async {});
        }),
      ),
    );
  }
}
