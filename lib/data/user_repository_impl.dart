import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:gen/domain/get_user_use_case.dart';

import '../domain/user_entity.dart';



class UserRepositoryImpl implements GetUsersUseCase {
  @override
  Future<List<UserEntity>> execute() async {
    try {
      String jsonString = await leituraDoArquivoJson();
      final Map<String, dynamic> jsonData = json.decode(jsonString);

      if (jsonData.containsKey('mcu')) {
        List<dynamic> jsonList = jsonData['mcu'];

        List<UserEntity> users = jsonList.map((json) => UserEntity.fromJson(json)).toList();

        return users;
      } else {
        print('Chave "mcu" não encontrada no JSON.');
        return [];
      }
    } catch (e) {
      print('Erro ao obter usuários: $e');
      return [];
    }
  }

  Future<String> leituraDoArquivoJson() async {
    try {
      return await rootBundle.loadString('assets/mock.json');
    } catch (e) {
      print('Erro ao ler o arquivo JSON dos assets: $e');
      return '';
    }
  }
}


