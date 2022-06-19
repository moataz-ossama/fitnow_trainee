abstract class Registerstates {

}

class registerIntialstate extends Registerstates{

}
class registerSuccessfulstate extends Registerstates{

}
class registerErrorstate extends Registerstates{
  final String error;
  registerErrorstate(this.error);
}
class registerLoadingstate extends Registerstates{


}