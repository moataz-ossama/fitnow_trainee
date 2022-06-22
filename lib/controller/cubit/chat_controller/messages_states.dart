abstract class Messagesstates {}


class IntialMessagesstate extends Messagesstates{}
class SuccessfulMessagesstate extends Messagesstates{}
class ErrorMessagesstate extends Messagesstates{}
class LoadingMessagesstate extends Messagesstates{}

///User State
class UserLoadingState extends Messagesstates{}
class UserSuccessState extends Messagesstates {}
class UserErrorState extends Messagesstates{}
///End of User State