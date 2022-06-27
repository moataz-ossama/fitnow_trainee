// @dart=2.9
import 'package:fitnow_trainee/controller/cubit/login_controller/login_model.dart';
import 'package:fitnow_trainee/controller/cubit/update_profile/update_profile_model.dart';



abstract class UpdateProfileStates {

}

class InitialUpdateProfileState extends UpdateProfileStates{

}
class SuccessfullUpdateProfilestate extends UpdateProfileStates{
  final UpdateProfileModel model;

  SuccessfullUpdateProfilestate(this.model);
}
class ErrorUpdateProfileState extends UpdateProfileStates{
  final UpdateProfileModel model;
  ErrorUpdateProfileState(this.model);
}
class LoadingUpdateProfileState extends UpdateProfileStates{


}