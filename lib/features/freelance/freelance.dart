import 'package:fitnow_trainee/features/freelance/all_offers.dart';
import 'package:fitnow_trainee/features/freelance/all_trainee_jobs.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../shared/project_colors/colors.dart';
import 'news_feed.dart';
import 'post.dart';

class FreelanceHome extends StatefulWidget {
  const FreelanceHome({Key? key}) : super(key: key);

  @override
  State<FreelanceHome> createState() => _FreelanceHomeState();
}

class _FreelanceHomeState extends State<FreelanceHome> {
  List<Widget> screens = [
    NewsFeed(),
    AllTraineeJobs(),
    Alloffers(),
  ];

  Color newsfeedbtn = Colors.black;
  Color alljobsbtn = Color(0xff5e5873);
  Color alloffersbtn = Color(0xff5e5873);
  int current_index = 0;
  final today = DateTime.now();
  DateTime now = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: AppBar(
          backgroundColor: Colors.grey[400],
          flexibleSpace: Container(

            child: Padding(
              padding: const EdgeInsets.only(left: 10.0,top: 30),
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Today   ' + '${DateFormat("MMM d").format(today)+'  ${DateFormat.jm().format(DateTime.now())}'}',
                              style: TextStyle(
                                fontSize: 15,
                                color: ProjectColors.green_color,
                              ),
                            ),
                          ],
                        ),


                      ],
                    ),
                  ),

                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,

                      children: [
                        TextButton(

                            onPressed: () {

                              setState(() {
                                current_index = 0;
                                newsfeedbtn=Colors.black;
                                alljobsbtn=ProjectColors.light_grey_color;
                                alloffersbtn=ProjectColors.light_grey_color;
                              });
                            },
                            child: Text(
                              'Coach Packages',
                              style: TextStyle(
                                  color:newsfeedbtn,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400),
                            )),
                        SizedBox(width: 25,),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                current_index = 1;
                                alljobsbtn  =Colors.black;
                                newsfeedbtn=ProjectColors.light_grey_color;
                                alloffersbtn=ProjectColors.light_grey_color;
                              });
                            },
                            child: Text(
                              'Trainee Jobs',
                              style: TextStyle(
                                  color: alljobsbtn,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400),
                            )),
                        SizedBox(width: 25,),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                current_index = 2;
                                alloffersbtn=Colors.black;
                                newsfeedbtn=ProjectColors.light_grey_color;
                                alljobsbtn=ProjectColors.light_grey_color;
                              });
                            },
                            child: Text(
                              'offers',
                              style: TextStyle(
                                  color: alloffersbtn,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: screens.elementAt(current_index),
    );
  }
} /*   */
