import 'package:flutter/material.dart';
import 'package:gen/presenter/get_user.dart';

import '../data/user_repository_impl.dart';
import '../domain/user_entity.dart';

class UserProvider extends ChangeNotifier {
  List<UserEntity> _users = [];

  List<UserEntity> get users => _users;

  Future<void> loadUsers() async {
    try {
      List<UserEntity> loadedUsers = await UserListPresenter(UserRepositoryImpl()).getUsers();
      _users = loadedUsers;
      notifyListeners();
    } catch (e) {
      print('Erro ao carregar usuários: $e');
    }
  }
}
