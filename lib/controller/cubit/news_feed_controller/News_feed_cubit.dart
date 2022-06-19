// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../shared/project_colors/colors.dart';
import '../../dio_helper.dart';
import 'news_feed_model.dart';
import 'news_feed_states.dart';

class NewsFeedCubit extends Cubit<NewsFeedStates> {


  NewsFeedCubit() : super(InitialPostState());

  static NewsFeedCubit get(context) => BlocProvider.of(context);

  void postoffer(@required String title, @required String price,@required String description,@required String skill1,@required String skill2) {
    emit(LoadingPostState());
    DioHelper.postdatatoken('/jobs/add', {'title': title, 'price': price,'description':description,'skills[0][title]':skill1,'skills[1][title]':skill2})
        .then((value) {
      print(value.data);

      emit(SuccessfulPoststate());
      Fluttertoast.showToast(
          msg: "your post posted successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: ProjectColors.green_color,
          textColor: Colors.white,
          fontSize: 16.0);
    }).catchError((error) {
      print("error m= " + error.toString());

      Fluttertoast.showToast(
          msg: "error in posting your post",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);

      emit(ErrorPostState(error.toString()));
    });
  }
}

