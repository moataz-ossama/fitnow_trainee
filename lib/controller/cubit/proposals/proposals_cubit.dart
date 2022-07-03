// @dart=2.9
import 'package:fitnow_trainee/controller/cubit/login_controller/login_model.dart';
import 'package:fitnow_trainee/controller/cubit/login_controller/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../shared/project_colors/colors.dart';
import '../../dio_helper.dart';
import 'proposals_model.dart';
import 'proposals_states.dart';





class ProposalsCubit extends Cubit<Proposalsstates>{
  static String token;
  static ProposalsModel model;
  ProposalsCubit():super (IntialProposalsstate());
  static ProposalsCubit get(context)=> BlocProvider.of(context);


  void getProposal( String job_id) {
    emit(LoadingProposalsstate());
    DioHelper.getdatatoken('/jobs/show/'+job_id).then((value){
      print(value.data);
      model= ProposalsModel.fromJson(value.data);
      emit(SuccessfulProposalsstate(model));
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
      emit(ErrorProposalsstate(model));
    });


  }
}