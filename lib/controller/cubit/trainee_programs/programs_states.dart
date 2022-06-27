
import 'programs_model.dart';

abstract class Programstates {

}
class IntialProgramstate extends Programstates{

}
class SuccessfullProgramstate extends Programstates{
  final ProgramsModel model;

  SuccessfullProgramstate(this.model);
}
class ErrorProgramstate extends Programstates{
  final ProgramsModel model;
  ErrorProgramstate(this.model);
}
class LoadingProgramstate extends Programstates{


}