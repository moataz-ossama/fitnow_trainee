// @dart=2.9
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

class ViewFullProgram extends StatefulWidget {
  const ViewFullProgram({Key key}) : super(key: key);

  @override
  State<ViewFullProgram> createState() => _ViewFullProgramState();

}

class _ViewFullProgramState extends State<ViewFullProgram> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Full Program"),
      ),
      body: BlocProvider(
        create: (BuildContext context) => ProgramsCubit(),
        child: BlocConsumer<ProgramsCubit, Programstates>(
            builder: (context, state) {
          return ConditionalBuilder(
            condition: ProgramsCubit.model!=null,
            fallback: (context) => Center(child: CircularProgressIndicator()),
            builder: (context) => Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: ProgramsCubit.model.data.program.weeks,
                        itemBuilder: (context, index) =>Container(
                          height: 100,

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
              height: 10,
            ),

            ],
          ),
              ) ),
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
