import '../data/models/user_model.dart';

abstract class UserState {}

class UserInitialState extends UserState {}

class UserSuccessState extends UserState {
  final List<UserModel> users;

  UserSuccessState({required this.users});
}

class UserErrorState extends UserState {
  final String errorText;

  UserErrorState({required this.errorText});
}

class UserLoadingState extends UserState {}
