// @dart=2.9
import 'package:fitnow_trainee/controller/cubit/login_controller/login_model.dart';
import 'package:fitnow_trainee/controller/cubit/login_controller/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../shared/project_colors/colors.dart';
import '../../dio_helper.dart';
import 'payment_models.dart';
import 'payment_states.dart';





class PaymentCubit extends Cubit<Paymentstates>{
  static String token;
  static PaymentModel model;
  PaymentCubit():super (IntialPaymentstate());
  static PaymentCubit get(context)=> BlocProvider.of(context);


  void Payment( String offer_id) {
    emit(LoadingPaymentstate());
    DioHelper.postdatatoken('/trainee-offers/pay', {'offer_id': offer_id}).then((value){
      print(value.data);
      model= PaymentModel.fromJson(value.data);
      emit(SuccessfulPaymentstate(model));
      Fluttertoast.showToast(
          msg: "payment url is ready",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: ProjectColors.green_color,
          textColor: Colors.white,
          fontSize: 16.0);
    }).catchError((error){
      print("error m= "+error.toString());
      Fluttertoast.showToast(
          msg: "error in getting payment url",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor:Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      emit(ErrorPaymentstate(model));
    });


  }
}