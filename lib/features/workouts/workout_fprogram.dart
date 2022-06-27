import 'dart:io';
import 'package:get/get.dart';
import 'package:fitnow_trainee/shared/project_colors/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../login&register/settings.dart';
import 'workout_details.dart';
import 'workouts.dart';

class WorkoutFirstProgram extends StatelessWidget {
  const WorkoutFirstProgram({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    DateTime now = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Workout First Program",
          style: TextStyle(color: ProjectColors.green_color),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[400],
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              icon: Icon(Icons.settings),
              onPressed: (){
                Get.to(LogoutScreen());},

              color: ProjectColors.dark_grey_color,
            ),
          )
        ],
      ),
      body: Container(
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Today  ' +
                    '${DateFormat("MMM d").format(today) + '  ${DateFormat.jm().format(DateTime.now())}'}',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration:
                    BoxDecoration(color: Colors.white, border: Border()),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Day 3",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Start Your Workout Today",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {
                          Get.to(Workouts());
                        },
                        child: Text(
                          "Start Workout",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                      height: 40,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.green),
                          color: ProjectColors.green_color,
                          borderRadius: BorderRadius.circular(5)),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
