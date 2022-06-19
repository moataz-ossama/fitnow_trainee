// @dart=2.9
import 'package:fitnow_trainee/controller/cubit/login_controller/login_model.dart';

import 'news_feed_model.dart';

abstract class NewsFeedStates {

}

class InitialPostState extends NewsFeedStates{

}
class SuccessfulPoststate extends NewsFeedStates{

}
class ErrorPostState extends NewsFeedStates{
   String error;
  ErrorPostState(this.error);
}
class LoadingPostState extends NewsFeedStates{


}