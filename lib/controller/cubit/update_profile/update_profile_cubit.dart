
//
//'/trainee/update',
// @dart=2.9

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../shared/project_colors/colors.dart';
import '../../dio_helper.dart';
import 'update_profile_model.dart';
import 'update_profile_states.dart';





class UpdateProfileCubit extends Cubit<UpdateProfileStates>{
  static UpdateProfileModel model;
  UpdateProfileCubit():super (InitialUpdateProfileState());
  static UpdateProfileCubit get(context)=> BlocProvider.of(context);


  void postupdateprofile(@required String mobile, @required String country,@required String birthdate,@required File photo,@required String gender) {
    emit(LoadingUpdateProfileState());
    DioHelper.postdata('/trainee/update', {'mobile': mobile, 'country': country,'birthdate':birthdate,'photo':photo,'gender':gender}).then((value){
      print(value.data);
      model= UpdateProfileModel.fromJson(value.data);
      emit(SuccessfullUpdateProfilestate(model));
      Fluttertoast.showToast(
          msg: "logged in successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: ProjectColors.green_color,
          textColor: Colors.white,
          fontSize: 16.0);
    }).catchError((error){
      print("error m= "+error.toString());

      Fluttertoast.showToast(
          msg: "email or password is not correct",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor:Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      emit(ErrorUpdateProfileState(model));

    });


  }
}