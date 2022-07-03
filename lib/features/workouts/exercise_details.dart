// @dart=2.9
import 'package:fitnow_trainee/controller/cubit/exercise%20data/exercise_cubit.dart';
import 'package:fitnow_trainee/features/workouts/exercise_description.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../controller/cubit/trainee_programs/programs_cubit.dart';
import '../../shared/project_colors/colors.dart';
import 'exercise_results.dart';

class ExerciseDetails extends StatefulWidget {
  const ExerciseDetails({Key key}) : super(key: key);

  @override
  static int ex_id;
  static int day_id;
  State<ExerciseDetails> createState() => _ExerciseDetailsState();
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

class _ExerciseDetailsState extends State<ExerciseDetails> {

  @override
var x=ExerciseDetails.getdata();
  int exercise_id=ExerciseDetails.ex_id;
  int day_id=ExerciseDetails.day_id;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        foregroundColor: Colors.grey[600],
        centerTitle: true,
        title: Text(
          ProgramsCubit.model.data.program.days[day_id].workout.workoutExercieses[exercise_id].details.title.toString(),
          style: TextStyle(color: ProjectColors.green_color),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: TextButton(
                onPressed: () {},
                child: Text(
                  "Begin",
                  style: TextStyle(color: Colors.grey[600]),
                )),
          )
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
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

                /*   Row(
                  children: [
                    Expanded(child: Text("weight in kg")),
                    Expanded(child: Text("training time duration in minutes "))
                  ],
                ),
                SizedBox(
                  height: 10,
                ),

                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        height: 50,
                        child:ProgramsCubit.model.data.program.days[day_id].workout.workoutExercieses[exercise_id].sets.length>0? TextFormField(
                          enabled: false,
                          textAlign: TextAlign.center,
                          textAlignVertical: TextAlignVertical.center,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText:ProgramsCubit.model.data.program.days[day_id].workout.workoutExercieses[exercise_id].sets[0].weight.toString() ,
                            border: OutlineInputBorder(borderSide: BorderSide()),
                          ),
                          style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 15),
                          showCursor: false,
                        ):TextFormField(
                          enabled: false,
                          textAlign: TextAlign.center,
                          textAlignVertical: TextAlignVertical.center,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "not specified",
                            border: OutlineInputBorder(borderSide: BorderSide()),
                          ),
                          style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 15),
                          showCursor: false,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        height: 50,
                        child:ProgramsCubit.model.data.program.days[day_id].workout.workoutExercieses[exercise_id].sets.length>0? TextFormField(
                          enabled: false,
                          textAlign: TextAlign.center,
                          textAlignVertical: TextAlignVertical.center,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText:ProgramsCubit.model.data.program.days[day_id].workout.workoutExercieses[exercise_id].sets[0].weight.toString() ,
                            border: OutlineInputBorder(borderSide: BorderSide()),
                          ),
                          style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 15),
                          showCursor: false,
                        ):TextFormField(
                          enabled: false,
                          textAlign: TextAlign.center,
                          textAlignVertical: TextAlignVertical.center,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "not specified",
                            border: OutlineInputBorder(borderSide: BorderSide()),
                          ),
                          style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 15),
                          showCursor: false,
                        ),
                      ),
                    ),

                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Description (press to see all details)",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                     TextButton(
                       onPressed: () {
                         ExerciseDescription.getdata();
                         Get.to(ExerciseDescription());},
                       child: Container(
                         width: double.infinity,
                         child: Padding(
                           padding: const EdgeInsets.all(20.0),
                           child: Text(
                             "",

                             style:TextStyle(color: Colors.grey[600]) ,),
                         ),
                         height: 120,
                         decoration: BoxDecoration(
                             color: ProjectColors.white_color,
                             border: Border.all(color: Colors.grey)),
                       ),
                     ),
                    SizedBox(
                      height: 20,
                    ),
                    TextButton(onPressed: (){}, child:     Container(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Get.to(() => ExerciseResults());
                            },
                            child: Text(
                              "Next",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ),
                          Icon(Icons.arrow_forward,color: ProjectColors.white_color,)
                        ],
                      ),
                      height: 40,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.green),
                          color: ProjectColors.green_color,
                          borderRadius: BorderRadius.circular(5)),
                    ) )
                  ],
                )*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
/*
 CircleAvatar(
                              backgroundColor: ProjectColors.white_color,
                              radius: 40.0,
                              child: TextFormField(
                                textAlignVertical: TextAlignVertical.center,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: '-',
                                  border: InputBorder.none,
                                ),
                                style: TextStyle(
                                    color: ProjectColors.light_grey_color,
                                    fontSize: 15),
                                showCursor: false,
                              ),
                         )
                            */
/*
 Container(
                        height: 50,
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          textAlignVertical: TextAlignVertical.center,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: 'Kilo Grams',
                            border: OutlineInputBorder(borderSide: BorderSide()),
                          ),
                          style: TextStyle(
                              color: ProjectColors.light_grey_color,
                              fontSize: 15),
                          showCursor: false,
                        ),
                      )
 */