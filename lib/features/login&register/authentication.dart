// @dart=2.9


import 'package:fitnow_trainee/features/login&register/login.dart';
import 'package:fitnow_trainee/layout/home_layout.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controller/cubit/all_offers/all_offers_cubit.dart';
import '../../controller/cubit/all_trainee_jobs/all_trainee_jobs_cubit.dart';
import '../../controller/cubit/coach_packages_controller/coach_packages_cubit.dart';
import '../../controller/cubit/view_profile/view_profile_cubit.dart';

class Authentication extends  StatefulWidget {


  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  String token;
  bool initial=true;
  @override
  Widget build(BuildContext context) {

    if(initial) {
      initial=false;
      SharedPreferences.getInstance().then((value) {
        token = value.getString('access_token');
        setState(() {

        });
      });
return CircularProgressIndicator();
    }else{
      if (token == null) {

        return LoginScreen();

      } else {
        setState(() {
          PackageCubit pc=new PackageCubit();
          pc.getcoachpackages();
          ViewProfileCubit p = new ViewProfileCubit();
          p.gettraineedata();
          AllTraineeJobsCubit tj=new AllTraineeJobsCubit();
          tj.getallTraineeJobs();
          AllOffersCubit oc=new AllOffersCubit();
          oc.getalloffers();
        });

        return HomeLayout();
      }
    }
  }
}
