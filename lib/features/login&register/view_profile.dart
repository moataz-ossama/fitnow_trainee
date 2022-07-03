import 'package:conditional_builder/conditional_builder.dart';
import 'package:fitnow_trainee/features/login&register/update_profile.dart';
import 'package:fitnow_trainee/shared/project_colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../controller/cubit/view_profile/view_profile_cubit.dart';
import '../../controller/cubit/view_profile/view_profile_states.dart';

class ViewProfile extends StatefulWidget {
  const ViewProfile({Key? key}) : super(key: key);

  @override
  State<ViewProfile> createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View Profile"),
        centerTitle: true,
        backgroundColor: ProjectColors.green_color,
      ),
      body: BlocProvider(
        create: (BuildContext context) => ViewProfileCubit(),
        child: BlocConsumer<ViewProfileCubit, ViewProfilestates>(
            builder: (context, state) {
          return ConditionalBuilder(
              condition: ViewProfileCubit.model != null,
              fallback: (context) => Center(child: CircularProgressIndicator()),
              builder: (context) => ShowTraineData());
        }, listener: (context, state) async {
          setState(() async {
            ViewProfileCubit pc = new ViewProfileCubit();
            pc.gettraineedata();
          });
        }),
      ),
    );
  }
}

Widget ShowTraineData() => Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: ProjectColors.white_color, width: 2),
                      shape: BoxShape.rectangle),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: ViewProfileCubit.model.data.traineeProfile.photo!=null?Image.network(
                        "${ViewProfileCubit.model.data.traineeProfile.photo}"):SvgPicture.asset('assets/images/Asset1.svg'),
                  ),
                  height: 150,
                  width: 120,
                )
                /*  CircleAvatar(
                  radius: 100.0,
               backgroundImage: NetworkImage("${ViewProfileCubit.model.data.traineeProfile.photo}"),
                )*/
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Expanded(
                    child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      "Name: ",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                )),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: ProjectColors.green_color),
                      child: Center(
                        child: Text(
                          ViewProfileCubit.model.data.user.fullname,
                          style: TextStyle(
                              fontSize: 15, color: ProjectColors.white_color),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      )),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                    child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      "E-mail: ",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                )),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: ProjectColors.green_color),
                      child: Center(
                        child: Text(
                          ViewProfileCubit.model.data.user.email,
                          style: TextStyle(
                              fontSize: 15, color: ProjectColors.white_color),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      )),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                    child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      "Gender: ",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                )),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: ProjectColors.green_color),
                      child: Center(
                        child: Text(
                          ViewProfileCubit.model.data.traineeProfile.gender ==
                                  "1"
                              ? "male"
                              : "female",
                          style: TextStyle(
                              fontSize: 15, color: ProjectColors.white_color),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      )),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                    child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      "Mobile: ",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                )),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: ProjectColors.green_color),
                      child: Center(
                        child: Text(
                          ViewProfileCubit.model.data.traineeProfile.mobile
                              .toString(),
                          style: TextStyle(
                              fontSize: 15, color: ProjectColors.white_color),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      )),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                    child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      "Birthdate:",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                )),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: ProjectColors.green_color),
                      child: Center(
                        child: Text(
                          ViewProfileCubit.model.data.traineeProfile.birthdate
                              .toString(),
                          style: TextStyle(
                              fontSize: 15, color: ProjectColors.white_color),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      )),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                    child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      "Country: ",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                )),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: ProjectColors.green_color),
                      child: Center(
                        child: Text(
                          ViewProfileCubit.model.data.traineeProfile.country
                              .toString(),
                          style: TextStyle(
                              fontSize: 15, color: ProjectColors.white_color),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      )),
                )
              ],
            ),
            SizedBox(
              height: 40,
            ),

          ],
        ),
      )),
    );
