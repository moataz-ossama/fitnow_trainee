// @dart=2.9
import 'package:fitnow_trainee/features/workouts/exercise_description.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controller/cubit/trainee_programs/programs_cubit.dart';
import '../../shared/project_colors/colors.dart';
import 'exercise_results.dart';

class ExerciseDetails extends StatefulWidget {
  const ExerciseDetails({Key key}) : super(key: key);
static int ex_id;
  static int day_id;
  @override
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
        exercise_id.toString()+"/"+ProgramsCubit.model.data.program.days[day_id].workout.workoutExercieses.length.toString(),
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
          padding: const EdgeInsets.all(40.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset("assets/images/barbell.png"),
                Row(
                  children: [
                    Text("barbell pullover and press"),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.info,
                          color: ProjectColors.green_color,
                        ))
                  ],
                ),
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
                          radius: 50.0,
                          child: Icon(
                            Icons.lock,
                            color: ProjectColors.green_color,
                            size: 40,
                          ),
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
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            textAlignVertical: TextAlignVertical.center,
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
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Center(
                      child: Text(
                        "Repeats Required",
                        textAlign: TextAlign.center,
                      ),
                    )),
                    Expanded(
                        child: Center(
                            child: Text("Rest", textAlign: TextAlign.center))),
                    Expanded(
                        child: Center(
                            child:
                                Text("Sets Made", textAlign: TextAlign.center)))
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
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
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        flex: 3,
                        child: Container(

                          height: 50,
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            textAlignVertical: TextAlignVertical.center,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: 'Narrow Grip',
                              border:
                                  OutlineInputBorder(borderSide: BorderSide()),
                            ),
                            style: TextStyle(
                                color: ProjectColors.light_grey_color,
                                fontSize: 15),
                            showCursor: false,
                          ),
                        )),
                    Expanded(
                        flex: 1,
                        child: Icon(
                          Icons.add_box_rounded,
                          size: 40,
                        ))
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Description",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                     TextButton(
                       onPressed: () {Get.to(ExerciseDescription());},
                       child: Container(
                         width: double.infinity,
                         child: Padding(
                           padding: const EdgeInsets.all(20.0),
                           child: Text(
                               "The back is the body region between the neck and the gulteal regions",style: TextStyle(color: Colors.black),),
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
