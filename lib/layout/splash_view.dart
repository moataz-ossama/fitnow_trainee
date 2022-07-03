import 'dart:async';

import 'package:fitnow_trainee/features/login&register/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  void initState() {
    super.initState();
    splashscreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8f8f8),
      body: Center(
        child: Container(
          width: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/images/Asset2.svg"),
              SvgPicture.asset("assets/images/Asset3.svg")
            ],
          ),
        ),
      ),
    );
  }

  void splashscreen() async{
    await Future
        .delayed(Duration(seconds: 2),(){});
    Get.off(Authentication());
  }
}
