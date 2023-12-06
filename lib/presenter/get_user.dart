import '../domain/get_user_use_case.dart';
import '../domain/user_entity.dart';

class UserListPresenter {
  final GetUsersUseCase getUsersUseCase;

  UserListPresenter(this.getUsersUseCase);

  Future<List<UserEntity>> getUsers() async {
    try {
      return await getUsersUseCase.execute();
    } catch (e) {
      print('Erro ao obter usuários: $e');
      return [];
    }
  }
}