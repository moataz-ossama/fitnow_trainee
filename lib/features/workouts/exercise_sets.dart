// @dart=2.9
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controller/cubit/trainee_programs/programs_cubit.dart';

class ExerciseSets extends StatefulWidget {
  const ExerciseSets({Key key}) : super(key: key);

  @override
  State<ExerciseSets> createState() => _ExerciseSetsState();
  static int id;
  static int exercise_id;

  static getdata() async {
    SharedPreferences sharedpref = await SharedPreferences.getInstance();

    id = sharedpref.getInt("day_id");
    print("day id in ex is" + id.toString());
    print("day ex num is" + exercise_id.toString());
    exercise_id = sharedpref.getInt("exercise_id");
  }
}

class _ExerciseSetsState extends State<ExerciseSets> {
  int day_id = ExerciseSets.id;
  int exercise_id = ExerciseSets.exercise_id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("exercise sets"),
      ),
      body: ProgramsCubit.model.data.program.days[day_id].workout != null
          ? ListView.builder(
              itemCount: ProgramsCubit.model.data.program.days[day_id].workout
                  .workoutExercieses[exercise_id].sets.length,
              itemBuilder: (context, index) => ProgramsCubit.model.data.program.days[day_id].workout.workoutExercieses[exercise_id].sets.length==0?Text("no specified sets"):Container(
                    child: Container(
                        child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "set" + index.toString(),
                              style: TextStyle(color: Colors.green),
                            ))),
                  ))
          : Text("No Specified Sets"),
    );
  }
}
