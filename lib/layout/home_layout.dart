import 'package:fitnow_trainee/features/freelance/all_offers.dart';
import 'package:fitnow_trainee/features/login&register/login.dart';
import 'package:fitnow_trainee/features/login&register/register.dart';
import 'package:fitnow_trainee/features/workouts/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import '../features/freelance/all_trainee_jobs.dart';
import '../features/freelance/freelance.dart';
import '../features/messages/all_chats_screen.dart';
import '../features/notifications/view_clients_notifications.dart';
import '../features/workouts/workout_fprogram.dart';
import '../features/workouts/workouts.dart';
import '../shared/project_colors/colors.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int current_index = 0;

  var f = 0xff5e5873;
  List<Widget> body_widget = [
    WorkoutFirstProgram(),
    FreelanceHome(),
    HomeScreen(),
    AllChats(),
    Alloffers()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body_widget.elementAt(current_index),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: ProjectColors.green_color,
        unselectedItemColor: ProjectColors.dark_grey_color,
        type: BottomNavigationBarType.fixed,
        currentIndex: current_index,
        onTap: (index) {
          setState(() {
            print(index);
            current_index = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset("assets/images/workout.png",height: 25,color: ProjectColors.dark_grey_color ),
            label: 'Workouts',
            activeIcon:  Image.asset("assets/images/workout.png",height: 25,color: ProjectColors.green_color,)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: 'News Feed',

          ),
          BottomNavigationBarItem(
            icon: new SvgPicture.asset(
              "assets/images/Asset2.svg",
              height: 50,
              width: 50,
              color: ProjectColors.dark_grey_color,
            ),
            label: '',
            activeIcon: new SvgPicture.asset(
              "assets/images/Asset2.svg",
              height: 50,
              width: 50,
              color: ProjectColors.green_color,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.message,
            ),
            label: 'messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications,
color: ProjectColors.dark_grey_color,
            ),
            label: 'notifications',
            activeIcon: Icon(
              Icons.notifications,
              color:ProjectColors.green_color ,
            ),

          ),
        ],
      ),
    );
  }
}
