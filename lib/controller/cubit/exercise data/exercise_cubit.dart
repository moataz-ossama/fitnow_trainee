// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../shared/project_colors/colors.dart';
import '../../dio_helper.dart';
import 'exercise_model.dart';
import 'exercise_states.dart';





class ExerciseCubit extends Cubit<Exercisestates>{
  static String token;
  static ExerciseModel model;
  ExerciseCubit():super (IntialExercisestate());
  static ExerciseCubit get(context)=> BlocProvider.of(context);


  void getexercisedata( String exercise_id) {
    emit(LoadingExercisestate());
    DioHelper.getdatatoken('/exercies-trainee/'+exercise_id).then((value){
      print(value.data);
      model= ExerciseModel.fromJson(value.data);
      emit(SuccessfulExercisestate(model));
      Fluttertoast.showToast(
          msg: "exercise data is ready",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: ProjectColors.green_color,
          textColor: Colors.white,
          fontSize: 16.0);
    }).catchError((error){
      print("error m= "+error.toString());
      Fluttertoast.showToast(
          msg: "error in getting exercise data",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor:Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      emit(ErrorExercisesstate(model));
    });


  }
}