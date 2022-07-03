// @dart=2.9
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../controller/cubit/trainee_programs/programs_cubit.dart';
class ExerciseDescription extends StatefulWidget {
  const ExerciseDescription({Key key}) : super(key: key);
  static int ex_id;
  static int day_id;
  @override
  State<ExerciseDescription> createState() => _ExerciseDescriptionState();
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

class _ExerciseDescriptionState extends State<ExerciseDescription> {
 var x=ExerciseDescription.getdata();
  int exercise_id=ExerciseDescription.ex_id;
  int day_id=ExerciseDescription.day_id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exercise Info"),
        centerTitle: true,
        backgroundColor: Colors.grey[300],
        foregroundColor: Colors.grey[600],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  alignment: Alignment.center,
                  child: Image.asset("assets/images/barbell.png")),
              SizedBox(
                height: 20,
              ),
              Text(
              "Title: "+    ProgramsCubit.model.data.program.days[day_id].workout.workoutExercieses[exercise_id].details.title.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Primary focus: "+    ProgramsCubit.model.data.program.days[day_id].workout.workoutExercieses[exercise_id].details.primaryFocus.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Tracking field: "+    ProgramsCubit.model.data.program.days[day_id].workout.workoutExercieses[exercise_id].details.trackingFiled.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Instructions: "+    ProgramsCubit.model.data.program.days[day_id].workout.workoutExercieses[exercise_id].details.instructions,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              SizedBox(
                height: 10,
              ),

      /*
              Text(
                "Instructions",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 130,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SingleChildScrollView(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: ProjectColors.green_color,
                                      ),
                                    ),
                                    child: CircleAvatar(
                                      backgroundColor: ProjectColors.white_color,
                                      radius: 15.0,
                                      child: Text(
                                        "1",
                                        style: TextStyle(
                                            color: ProjectColors.green_color,
                                            fontSize: 20),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    flex: 5,
                                    child: Text(
                                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
                                      maxLines: 3,
                                      style: TextStyle(fontSize: 10),
                                      overflow: TextOverflow.ellipsis,
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SingleChildScrollView(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: ProjectColors.green_color,
                                      ),
                                    ),
                                    child: CircleAvatar(
                                      backgroundColor: ProjectColors.white_color,
                                      radius: 15.0,
                                      child: Text(
                                        "1",
                                        style: TextStyle(
                                            color: ProjectColors.green_color,
                                            fontSize: 20),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    flex: 5,
                                    child: Text(
                                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
                                      maxLines: 3,
                                      style: TextStyle(fontSize: 10),
                                      overflow: TextOverflow.ellipsis,
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SingleChildScrollView(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: ProjectColors.green_color,
                                      ),
                                    ),
                                    child: CircleAvatar(
                                      backgroundColor: ProjectColors.white_color,
                                      radius: 15.0,
                                      child: Text(
                                        "1",
                                        style: TextStyle(
                                            color: ProjectColors.green_color,
                                            fontSize: 20),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    flex: 5,
                                    child: Text(
                                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
                                      maxLines: 3,
                                      style: TextStyle(fontSize: 10),
                                      overflow: TextOverflow.ellipsis,
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SingleChildScrollView(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: ProjectColors.green_color,
                                      ),
                                    ),
                                    child: CircleAvatar(
                                      backgroundColor: ProjectColors.white_color,
                                      radius: 15.0,
                                      child: Text(
                                        "1",
                                        style: TextStyle(
                                            color: ProjectColors.green_color,
                                            fontSize: 20),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    flex: 5,
                                    child: Text(
                                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
                                      maxLines: 3,
                                      style: TextStyle(fontSize: 10),
                                      overflow: TextOverflow.ellipsis,
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              */

            ],
          ),
        ),
      ),
    );
  }
}
