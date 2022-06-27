// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../dio_helper.dart';
import 'view_profile_model.dart';
import 'view_profile_states.dart';


class ViewProfileCubit extends Cubit<ViewProfilestates>{
  static ViewProfileModel model;
  ViewProfileCubit():super (IntialViewProfilestate());
  static ViewProfileCubit get(context)=> BlocProvider.of(context);
  void gettraineedata(){
    emit(IntialViewProfilestate());
    DioHelper.getdatatoken('/trainee/data' ).then((value) {
      model=ViewProfileModel.fromJson(value.data);
      print(model.status);

      emit(SuccessfulViewProfilestate(model));
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
      emit(ErrorViewProfilestate(model));

    });
  }
}