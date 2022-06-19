import 'package:fitnow_trainee/controller/cubit/login_controller/login_model.dart';

abstract class Loginstates {

}
class ChangePasswordVisibility extends Loginstates{

}
class Intialloginstate extends Loginstates{

}
class Successfulloginstate extends Loginstates{
final LoginModel loginmodel;

  Successfulloginstate(this.loginmodel);
}
class Errorloginstate extends Loginstates{
  final LoginModel loginmodel;
  Errorloginstate(this.loginmodel);
}
class Loadingloginstate extends Loginstates{


}