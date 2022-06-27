// @dart=2.9
import 'package:fitnow_trainee/controller/cubit/login_controller/login_model.dart';

import 'view_profile_model.dart';



abstract class ViewProfilestates {

}
class IntialViewProfilestate extends ViewProfilestates{

}
class SuccessfulViewProfilestate extends ViewProfilestates{
  ViewProfileModel model;

  SuccessfulViewProfilestate(this.model);
}
class ErrorViewProfilestate extends ViewProfilestates{
  ViewProfileModel model;
  ErrorViewProfilestate(this.model);
}
class LoadingViewProfilestate extends ViewProfilestates{


}