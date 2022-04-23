abstract class QitLoginStates {}

class QitLoginInitialState extends QitLoginStates {}

class QitLoginLoadingState extends QitLoginStates {}
class QitLoginSuccessState extends QitLoginStates {}
class QitChangePasswordVisibilityState extends QitLoginStates {}
class QitLoginErrorState extends QitLoginStates {
  final String error;
  QitLoginErrorState(this.error);
}
