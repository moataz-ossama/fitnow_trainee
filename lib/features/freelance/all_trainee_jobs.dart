// @dart=2.9
import 'package:conditional_builder/conditional_builder.dart';
import 'package:fitnow_trainee/features/freelance/job_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controller/cubit/all_trainee_jobs/all_trainee_jobs_cubit.dart';
import '../../controller/cubit/all_trainee_jobs/all_trainee_jobs_states.dart';
import '../../controller/cubit/coach_packages_controller/coach_packages_cubit.dart';
import '../../shared/project_colors/colors.dart';

class AllTraineeJobs extends StatefulWidget {
  const AllTraineeJobs({Key key}) : super(key: key);

  @override
  State<AllTraineeJobs> createState() => _AllTraineeJobsState();
}

class _AllTraineeJobsState extends State<AllTraineeJobs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Jobs"),
        centerTitle: true,
        backgroundColor: ProjectColors.green_color,
      ),
      body: Container(
        color: Colors.grey[300],
        child: BlocProvider(
          create: (BuildContext context) => AllTraineeJobsCubit(),
          child: BlocConsumer<AllTraineeJobsCubit, AllTraineeJobsstates>(
              builder: (context, state) {
                return ConditionalBuilder(
                  condition: AllTraineeJobsCubit.model != null,
                  fallback: (context) => Center(child: CircularProgressIndicator()),
                  builder: (context) =>Padding(
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
                                  AllTraineeJobsCubit.model.data.data.length,
                                      (index) => Column(
                                    children: [
                                      Container(
                                        height: 300,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                              color: ProjectColors.green_color,
                                           width: 2 ),
                                            borderRadius: BorderRadius.circular(10)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Column(
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: Text(
                                                  AllTraineeJobsCubit
                                                      .model.data.data[index].title,
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
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Job Description:",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color:
                                                        ProjectColors.green_color,
                                                        fontWeight: FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 5,),
                                              Expanded(
                                                flex: 2,
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            AllTraineeJobsCubit
                                                                .model
                                                                .data
                                                                .data[index]
                                                                .description ==
                                                                null
                                                                ? "no specified description"
                                                                : AllTraineeJobsCubit.model.data
                                                                .data[index].description,
                                                            maxLines: 4,
                                                            overflow: TextOverflow.ellipsis,
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                color: ProjectColors
                                                                    .dark_grey_color),
                                                          ),
                                                        ),
                                                      ],
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
                                                              Icons.attach_money,
                                                              color: ProjectColors.green_color,
                                                            ),
                                                            Text(
                                                              "price: ",
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  color:
                                                                  ProjectColors.green_color,
                                                                  fontWeight: FontWeight.bold),
                                                            ),
                                                            Text(AllTraineeJobsCubit
                                                                .model.data.data[index].price
                                                                .toString()),
                                                            Text(" Egp"),
                                                          ],
                                                        )),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                            Expanded(
                                                flex: 1,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 40,
                                                        child: TextButton(
                                                            onPressed: () async {
                                                              SharedPreferences sharedpref =
                                                              await SharedPreferences
                                                                  .getInstance();

                                                              sharedpref.setString(
                                                                  'job_price',
                                                                  AllTraineeJobsCubit
                                                                      .model.data.data[index].price
                                                                      .toString());
                                                              sharedpref.setString(
                                                                  'job_description',
                                                                  AllTraineeJobsCubit
                                                                      .model.data.data[index].description
                                                                      .toString());
                                                              sharedpref.setString(
                                                                  'job_title',
                                                                  AllTraineeJobsCubit
                                                                      .model.data.data[index].title
                                                                      .toString());
JobDetails.getdata();
                                                              Get.to(JobDetails());

                                                            },
                                                            child: Text(
                                                              "View Job Details",
                                                              style: TextStyle(
                                                                  color: ProjectColors
                                                                      .white_color),
                                                            )),
                                                        decoration: BoxDecoration(
                                                            color: ProjectColors.green_color,
                                                            borderRadius: BorderRadius.circular(10)
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),

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
                  ),
                );
              },

              listener: (context, state) async {
                setState(() async {
                  PackageCubit pc = new PackageCubit();
                  pc.getcoachpackages();
                  AllTraineeJobsCubit tj=new AllTraineeJobsCubit();
                  tj.getallTraineeJobs();
                });
              }),
        ),
      ),
    );
  }
}
