
import 'dart:io';
import 'package:fitnow_trainee/controller/cubit/register_controller/register_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../shared/project_colors/colors.dart';
import '../../dio_helper.dart';





class Registercubit extends Cubit<Registerstates>{
  Registercubit():super (registerIntialstate());
static Registercubit get(context)=> BlocProvider.of(context);

void userregister(@required String fullname, @required String email, @required String password , @required String gender,@required String country,) {
  emit(registerLoadingstate());
  DioHelper.postdata('/register', {'fullname': fullname,'email': email, 'password': password,'type': 2,'gender': gender,'country': country}).then((value){
    print(value.data);
    Fluttertoast.showToast(
        msg: "Registered successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: ProjectColors.green_color,
        textColor: Colors.white,
        fontSize: 16.0);
    emit(registerSuccessfulstate());
    }).catchError((error){

    print(error.toString());
    Fluttertoast.showToast(
        msg: "Error in Registration",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: ProjectColors.green_color,
        textColor: Colors.white,
        fontSize: 16.0);
    emit(registerErrorstate(error.toString()));
  });


}
}