// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../dio_helper.dart';
import 'all_offers_model.dart';
import 'all_offers_states.dart';


class AllOffersCubit extends Cubit<Alloffersstates> {
  static AllOffersModel model;

  AllOffersCubit() : super(IntialAllofferssstate());

  static AllOffersCubit get(context) => BlocProvider.of(context);

  void getalloffers() {
    emit(IntialAllofferssstate());

    DioHelper.getdatatoken('/trainee-offers/list').then((value) {
      model = AllOffersModel.fromJson(value.data);

      emit(SuccessfulAlloffersstate(model));
    }).catchError((error) {
      print("error m= " + error.toString());

      Fluttertoast.showToast(
          msg: "no news feed data",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      emit(ErrorAlloffersstate(model));
    });
  }
}
