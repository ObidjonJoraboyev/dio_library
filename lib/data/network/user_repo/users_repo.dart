import 'package:dio_library/data/models/user_model.dart';
import 'package:dio_library/data/network/api_provider/api_provider.dart';

class UserRepository {
  UserRepository({required this.apiProvider});

  final ApiProvider apiProvider;

  Future<List<UserModel>> getUserInfo() => apiProvider.getUserInfo();

  Future<String> addUserInfo(UserModel userModel) =>
      apiProvider.postUserInfo(userModel: userModel);

  Future<String> deleteUserInfo({required String uuId}) =>
      apiProvider.deleteUserInfo(uuid: uuId);

  Future<String> updateUserInfo({required UserModel userModel}) =>
      apiProvider.updateUserInfo(userModel: userModel);
}
