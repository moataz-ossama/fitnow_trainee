// @dart=2.9
import 'package:firebase_core/firebase_core.dart';
import 'package:fitnow_trainee/controller/cubit/chat_controller/messeges_cubit.dart';
import 'package:fitnow_trainee/controller/cubit/login_controller/login_model.dart';
import 'package:fitnow_trainee/features/login&register/authentication.dart';
import 'package:fitnow_trainee/features/login&register/login.dart';
import 'package:fitnow_trainee/shared/project_colors/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'layout/home_layout.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

MyApp();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home:Authentication(),
    );
  }

}
