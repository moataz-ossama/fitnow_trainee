// @dart=2.9
import 'package:fitnow_trainee/controller/cubit/login_controller/login_model.dart';

import 'proposals_model.dart';








abstract class Proposalsstates {

}
class IntialProposalsstate extends Proposalsstates{

}
class SuccessfulProposalsstate extends Proposalsstates{
  ProposalsModel model;

  SuccessfulProposalsstate(this.model);
}
class ErrorProposalsstate extends Proposalsstates{
  ProposalsModel model;
  ErrorProposalsstate(this.model);
}
class LoadingProposalsstate extends Proposalsstates{


}