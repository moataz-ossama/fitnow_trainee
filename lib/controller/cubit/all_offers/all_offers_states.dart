// @dart=2.9
import 'package:fitnow_trainee/controller/cubit/login_controller/login_model.dart';

import 'all_offers_model.dart';




abstract class Alloffersstates {

}
class IntialAllofferssstate extends Alloffersstates{

}
class SuccessfulAlloffersstate extends Alloffersstates{
  AllOffersModel model;

  SuccessfulAlloffersstate(this.model);
}
class ErrorAlloffersstate extends Alloffersstates{
  AllOffersModel model;
  ErrorAlloffersstate(this.model);
}
class LoadingAllOffersstate extends Alloffersstates{


}