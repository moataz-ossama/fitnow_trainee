// @dart=2.9
import 'package:fitnow_trainee/controller/cubit/login_controller/login_model.dart';

import 'coach_packages_model.dart';

abstract class CoachPackagesstates {

}
class IntialCoachPackagesstate extends CoachPackagesstates{

}
class SuccessfulCoachPackagesstate extends CoachPackagesstates{
   PackagesModel packagedmodel;

   SuccessfulCoachPackagesstate(this.packagedmodel);
}
class ErrorCoachPackagesstate extends CoachPackagesstates{
   PackagesModel packagedmodel;
   ErrorCoachPackagesstate(this.packagedmodel);
}
class LoadingCoachPackagesstate extends CoachPackagesstates{


}