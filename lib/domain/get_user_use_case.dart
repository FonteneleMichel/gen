import 'package:gen/domain/user_entity.dart';

abstract class GetUsersUseCase {
  Future<List<UserEntity>> execute();
}