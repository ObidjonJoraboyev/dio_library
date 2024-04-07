import 'package:dio_library/blocs/user_event.dart';
import 'package:dio_library/blocs/user_state.dart';
import 'package:dio_library/data/models/user_model.dart';
import 'package:dio_library/data/network/user_repo/users_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc({required this.currenciesRepo}) : super(UserInitialState()) {
    on<GetUserInfoEvent>((event, emit) async {
      emit(UserLoadingState());
      List<UserModel> users = await currenciesRepo.getUserInfo();
      if (users.isEmpty) {
        emit(UserErrorState(errorText: "Error list is empty."));
      } else {
        emit(UserSuccessState(users: users));
      }
    });

    on<PostUserInfoEvent>((event, emit) async {
      emit(UserLoadingState());
      await currenciesRepo.addUserInfo(event.userModel);
      List<UserModel> users = await currenciesRepo.getUserInfo();

      emit(UserSuccessState(users: users));
    });

    on<DeleteUserInfoEvent>((event, emit) async {
      emit(UserLoadingState());
      await currenciesRepo.deleteUserInfo(uuId: event.uuId);
      List<UserModel> users = await currenciesRepo.getUserInfo();
      emit(UserSuccessState(users: users));
    });
    on<UpdateUserInfoEvent>((event, emit) async {
      emit(UserLoadingState());
      await currenciesRepo.updateUserInfo(userModel: event.userModel);
      List<UserModel> users = await currenciesRepo.getUserInfo();
      emit(UserSuccessState(users: users));
    });
  }

  final UserRepository currenciesRepo;
}
