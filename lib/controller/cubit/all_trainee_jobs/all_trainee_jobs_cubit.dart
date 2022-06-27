// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../dio_helper.dart';
import 'all_trainee_jobs_model.dart';
import 'all_trainee_jobs_states.dart';


class AllTraineeJobsCubit extends Cubit<AllTraineeJobsstates> {
  static AllTraineeJobsModel model;

  AllTraineeJobsCubit() : super(IntialAllTraineeJobsstate());

  static AllTraineeJobsCubit get(context) => BlocProvider.of(context);

  void getallTraineeJobs() {
    emit(IntialAllTraineeJobsstate());

    DioHelper.getdatatoken('/jobs/all').then((value) {
      model = AllTraineeJobsModel.fromJson(value.data);

      emit(SuccessfulAllTraineeJobsstate(model));
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
      emit(ErrorAllTraineeJobsstate(model));
    });
  }
}
