// @dart=2.9
import 'package:fitnow_trainee/controller/cubit/login_controller/login_model.dart';

import 'all_trainee_jobs_model.dart';


abstract class AllTraineeJobsstates {

}
class IntialAllTraineeJobsstate extends AllTraineeJobsstates{

}
class SuccessfulAllTraineeJobsstate extends AllTraineeJobsstates{
  AllTraineeJobsModel model;

  SuccessfulAllTraineeJobsstate(this.model);
}
class ErrorAllTraineeJobsstate extends AllTraineeJobsstates{
  AllTraineeJobsModel model;
  ErrorAllTraineeJobsstate(this.model);
}
class LoadingAllTraineeJobsstate extends AllTraineeJobsstates{


}