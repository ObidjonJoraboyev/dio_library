import 'package:dio_library/data/models/user_model.dart';

abstract class UserEvent {}

class GetUserInfoEvent extends UserEvent {}

class DeleteUserInfoEvent extends UserEvent {
  final String uuId;

  DeleteUserInfoEvent({required this.uuId});
}

class PostUserInfoEvent extends UserEvent {
  final UserModel userModel;

  PostUserInfoEvent({required this.userModel});
}

class UpdateUserInfoEvent extends UserEvent {
  final UserModel userModel;

  UpdateUserInfoEvent({required this.userModel});
}
