// @dart=2.9
import 'package:fitnow_trainee/controller/cubit/login_controller/login_model.dart';

import 'payment_models.dart';






abstract class Paymentstates {

}
class IntialPaymentstate extends Paymentstates{

}
class SuccessfulPaymentstate extends Paymentstates{
  PaymentModel model;

  SuccessfulPaymentstate(this.model);
}
class ErrorPaymentstate extends Paymentstates{
  PaymentModel model;
  ErrorPaymentstate(this.model);
}
class LoadingPaymentstate extends Paymentstates{


}