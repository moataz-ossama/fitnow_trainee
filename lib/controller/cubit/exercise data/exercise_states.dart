// @dart=2.9
import 'exercise_model.dart';

abstract class Exercisestates {

}
class IntialExercisestate extends Exercisestates{

}
class SuccessfulExercisestate extends Exercisestates{
  ExerciseModel model;

  SuccessfulExercisestate(this.model);
}
class ErrorExercisesstate extends Exercisestates{
  ExerciseModel model;
  ErrorExercisesstate(this.model);
}
class LoadingExercisestate extends Exercisestates{


}