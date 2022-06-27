// @dart=2.9
import 'package:fitnow_trainee/controller/cubit/coach_packages_controller/coach_packages_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../dio_helper.dart';
import 'programs_model.dart';
import 'programs_states.dart';


class ProgramsCubit extends Cubit<Programstates>{
  static ProgramsModel model;
  ProgramsCubit():super (IntialProgramstate());
  static ProgramsCubit get(context)=> BlocProvider.of(context);
  void getprogram(){
    emit(IntialProgramstate());
    DioHelper.getdatatoken('/assign-program/trainee/list' ).then((value) {
      model=ProgramsModel.fromJson(value.data);

      emit(SuccessfullProgramstate(model));
    }).catchError((error){
      print("error m= "+error.toString());

      Fluttertoast.showToast(
          msg: "no news feed data",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor:Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      emit(ErrorProgramstate(model));

    });
  }
}