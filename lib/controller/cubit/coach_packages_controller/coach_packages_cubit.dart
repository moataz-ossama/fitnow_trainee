// @dart=2.9
import 'package:fitnow_trainee/controller/cubit/coach_packages_controller/coach_packages_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../dio_helper.dart';
import 'coach_packages_states.dart';

class PackageCubit extends Cubit<CoachPackagesstates>{
 static PackagesModel model;
  PackageCubit():super (IntialCoachPackagesstate());
  static PackageCubit get(context)=> BlocProvider.of(context);
  void getcoachpackages(){
    emit(IntialCoachPackagesstate());
    DioHelper.getdatatoken('/coach-packages/trainee/list' ).then((value) {
model=PackagesModel.fromJson(value.data);

emit(SuccessfulCoachPackagesstate(model));
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
      emit(ErrorCoachPackagesstate(model));

    });
  }
}