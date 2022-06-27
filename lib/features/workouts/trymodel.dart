// @dart=2.9
import 'package:conditional_builder/conditional_builder.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controller/cubit/coach_packages_controller/coach_packages_cubit.dart';
import '../../controller/cubit/coach_packages_controller/coach_packages_states.dart';
import '../../controller/cubit/trainee_programs/programs_cubit.dart';
import '../../controller/cubit/trainee_programs/programs_states.dart';
import '../../shared/project_colors/colors.dart';

class NewsFeed extends StatefulWidget {


  @override
  State<NewsFeed> createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {
  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      child: BlocProvider(
        create: (BuildContext context) => ProgramsCubit(),
        child: BlocConsumer<ProgramsCubit, Programstates>(
            builder: (context, state) {
              return ConditionalBuilder(
                condition: ProgramsCubit.model != null,
                fallback: (context) =>
                    Center(child: CircularProgressIndicator()),
                builder: (context) => programDescriptionbuilder(),
              );
            }, listener: (context, state) async {
          setState(() async {
            ProgramsCubit pc = new ProgramsCubit();
            pc.getprogram();
          });
        }),
      ),
    );
  }
}

Widget programDescriptionbuilder() =>
    Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: GridView.count(
                  childAspectRatio: 1 / 0.8,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 1,
                  children: List.generate(
                    ProgramsCubit.model.data.program.weeks, (index) =>
                      Column(
                        children: [
                          Container(
                            height: 300,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: ProjectColors.green_color,
                                ),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      ProgramsCubit
                                          .model.data.program.title,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: ProjectColors.green_color,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .start,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            ProgramsCubit
                                                .model.data.program.description,
                                            maxLines: 4,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: 14,
                                                color:
                                                ProjectColors
                                                    .dark_grey_color),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  /* Row(children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 20,right: 20),
                                        child: Container(

                                          child: Text( PackageCubit.model.data
                                              .listdata[index]
                                              .type??'no specified type'),),
                                      )
                                    ],),*/
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.timer_outlined,
                                                  color: ProjectColors
                                                      .green_color,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "Duration: ",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: ProjectColors
                                                          .green_color,
                                                      fontWeight: FontWeight
                                                          .bold),
                                                ),
                                                Text( ProgramsCubit
                                                    .model.data.program.weeks.toString()),
                                                Text(" weeks"),
                                              ],
                                            )),
                                        Expanded(
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.attach_money,
                                                  color: ProjectColors
                                                      .green_color,
                                                ),
                                                Text(
                                                  "price: ",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: ProjectColors
                                                          .green_color,
                                                      fontWeight: FontWeight
                                                          .bold),
                                                ),
                                                Text( ProgramsCubit
                                                    .model.data.program.days[index].workoutId.toString()),
                                                Text(" Egp"),
                                              ],
                                            )),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Expanded(
                                    flex: 1,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            width: double.infinity,
                                            height: 40,
                                            child: TextButton(
                                                onPressed: () {},
                                                child: Text("apply",
                                                  style: TextStyle(
                                                      color: ProjectColors
                                                          .white_color),)),
                                            decoration: BoxDecoration(
                                                color: ProjectColors
                                                    .green_color
                                            ),

                                          ),
                                        )

                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                  )),
            ),
          ),
        ],
      ),
    );
/*// To parse this JSON data, do
//
//     final traineeJobs = traineeJobsFromJson(jsonString);


*/
