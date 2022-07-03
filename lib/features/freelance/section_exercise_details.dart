// @dart=2.9
import 'package:fitnow_trainee/controller/cubit/exercise%20data/exercise_cubit.dart';
import 'package:fitnow_trainee/shared/project_colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controller/cubit/trainee_programs/programs_cubit.dart';

class SectionExerciseDetails extends  StatefulWidget {
  const SectionExerciseDetails({Key key}) : super(key: key);

  @override
  State<SectionExerciseDetails> createState() => _SectionExerciseDetailsState();
  static int ex_id;
  static int day_id;
  static getdata() async {
    SharedPreferences sharedpref =
    await SharedPreferences
        .getInstance();
    ex_id = sharedpref.getInt('exercise_id');
    day_id=sharedpref.getInt('day_id');
    print("my ex id os"+ex_id.toString());
    print("my d id os"+day_id.toString());
  }
}

class _SectionExerciseDetailsState extends State<SectionExerciseDetails> {
  @override
  int exercise_id=SectionExerciseDetails.ex_id;
  int day_id=SectionExerciseDetails.day_id;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ProjectColors.green_color,
        title: Text(ExerciseCubit.model.data.title,style: TextStyle(color: ProjectColors.white_color),),),
body: SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
  children: [
      Row(
        children: [
          Expanded(child: Container(height: 200, width:double.infinity , child: Image.network(ExerciseCubit.model.data.images[0]))),
        ],
      ),
    SizedBox(height: 20,),
    Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text("Primary Focus: ",style: TextStyle(color: ProjectColors.green_color,fontWeight: FontWeight.bold,fontSize: 16),),
        Text(ExerciseCubit.model.data.primaryFocus)
      ],
    ),
    SizedBox(height: 20,),
    Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text("Instructions: ",style: TextStyle(color: ProjectColors.green_color,fontWeight: FontWeight.bold,fontSize: 16),),
      ],
    ),
    Text(ExerciseCubit.model.data.instructions),
    SizedBox(height: 20,),
    Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: ProjectColors.green_color,
                  ),
                ),
                child: CircleAvatar(
                  backgroundColor: ProjectColors.white_color,
                  radius: 40.0,
                  child: Text(
                    ProgramsCubit.model.data.program.days[0].workout.workoutExercieses[1].sets.length.toString(),
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: ProjectColors.green_color,
              ),
            ),
            child: CircleAvatar(
              backgroundColor: ProjectColors.white_color,
              radius: 40.0,
              child: ProgramsCubit.model.data.program.days[0].workout.workoutExercieses[1].sets.length>0?Text(
                ProgramsCubit.model.data.program.days[0].workout.workoutExercieses[1].sets[0].speed.toString(),
                style: TextStyle(color: Colors.grey[600]),
              ):Text("0",  style: TextStyle(color: Colors.grey[600]),),
            ),
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: ProjectColors.green_color,
              ),
            ),
            child: CircleAvatar(
              backgroundColor: ProjectColors.white_color,
              radius: 40.0,
              child: ProgramsCubit.model.data.program.days[0].workout.workoutExercieses[1].sets.length>0?Text(
                ProgramsCubit.model.data.program.days[0].workout.workoutExercieses[1].sets[0].time.toString(),
                style: TextStyle(color: Colors.grey[600]),
              ):Text("0",  style: TextStyle(color: Colors.grey[600]),),
            ),
          ),
        ),
      ],
    ),
    SizedBox(height: 5,),
    Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            child: Center(
              child: Text(
                "number of sets",
                textAlign: TextAlign.center,
              ),
            )),
        Expanded(
            child: Center(
                child: Text("time required", textAlign: TextAlign.center))),
        Expanded(
            child: Center(
                child:
                Text("tempo", textAlign: TextAlign.center)))
      ],
    ),

  ],
),
    )),

    );

  }
}
