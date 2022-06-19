// @dart=2.9
import 'package:fitnow_trainee/controller/cubit/login_controller/login_model.dart';
import 'package:fitnow_trainee/controller/cubit/login_controller/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../shared/project_colors/colors.dart';
import '../../dio_helper.dart';





class Logincubit extends Cubit<Loginstates>{
  static String token;
  static LoginModel model;
Logincubit():super (Intialloginstate());
static Logincubit get(context)=> BlocProvider.of(context);


void userlogin( @required String email, @required String password) {
  emit(Loadingloginstate());
  DioHelper.postdata('/login', {'email': email, 'password': password}).then((value){
    print(value.data);
    model= LoginModel.fromjson(value.data);
    emit(Successfulloginstate(model));
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
    emit(Errorloginstate(model));

  });


}
}