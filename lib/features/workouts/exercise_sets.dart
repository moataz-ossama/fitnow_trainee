// @dart=2.9


import 'package:flutter/material.dart';

import '../../controller/cubit/trainee_programs/programs_cubit.dart';

class ExerciseSets extends StatefulWidget {
  const ExerciseSets({Key key}) : super(key: key);

  @override
  State<ExerciseSets> createState() => _ExerciseSetsState();
}

class _ExerciseSetsState extends State<ExerciseSets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("exercise sets"),
      ),
      body: ListView.builder(
          itemCount: ProgramsCubit.model.data.program.days[5].workout.workoutExercieses[3].sets.length,
          itemBuilder: (context, index) => Container(

            child:  Container(child: TextButton(onPressed: (){}, child: Text("set" +  index.toString(),style: TextStyle(color: Colors.green),))) ,
          )),
    );
  }
}
