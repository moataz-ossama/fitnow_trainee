// @dart=2.9
import 'package:conditional_builder/conditional_builder.dart';
import 'package:fitnow_trainee/features/freelance/apply_to_package_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controller/cubit/coach_packages_controller/coach_packages_cubit.dart';
import '../../controller/cubit/coach_packages_controller/coach_packages_states.dart';
import '../../shared/project_colors/colors.dart';

class OfferDescription extends StatefulWidget {
  const OfferDescription({Key key}) : super(key: key);

  @override
  State<OfferDescription> createState() => _OfferDescriptionState();
  static  String title;
  static   String price;
  static   String description;
  static  String duration;


  static getdata()async{
    SharedPreferences sharedpref =
    await SharedPreferences
        .getInstance();
    title =await sharedpref.getString('title');
    description =await sharedpref.getString('description');
    duration =await sharedpref.getString('duration');
    price =await sharedpref.getString('price');
    print("get data is executed");


  }
}

class _OfferDescriptionState extends State<OfferDescription> {

String titlestring= OfferDescription.title;
String pricestring= OfferDescription.price;
String descriptionstring= OfferDescription.description;
String durationstring= OfferDescription.duration;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: ProjectColors.white_color),
        backgroundColor: ProjectColors.green_color,
        centerTitle: true,
        title: Text("Package Details")
      ),
      body:  Padding(
        padding: const EdgeInsets.only(left: 30.0, right: 30, top: 20,bottom: 20),
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  titlestring,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: ProjectColors.green_color,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Package Description: ",
                      style: TextStyle(
                          fontSize: 16,
                          color:
                          ProjectColors.green_color,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    descriptionstring,
                    style: TextStyle(
                        fontSize: 15, color: ProjectColors.dark_grey_color),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Row(
                          children: [
                            Icon(
                              Icons.timer_outlined,
                              color: ProjectColors.green_color,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Duration: ",
                              style: TextStyle(
                                  fontSize: 16,
                                  color:
                                  ProjectColors.green_color,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(durationstring),
                            Text(" weeks"),
                          ],
                        )),
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
                            Text(pricestring),
                            Text(" Egp"),
                          ],
                        )),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: 40,
                            child: TextButton(
                                onPressed: () async {
                                  Get.to(ApplyToForm());

                                },
                                child: Text(
                                  "apply",
                                  style: TextStyle(
                                      color: ProjectColors
                                          .white_color),
                                )),
                            decoration: BoxDecoration(
                                color: ProjectColors.green_color),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
/**/