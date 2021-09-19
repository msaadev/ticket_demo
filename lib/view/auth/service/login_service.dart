import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ticket_try/view/auth/model/request_model.dart';

abstract class ILoginService {
  final String path = 'test/login';
  final Dio dio;

  ILoginService(this.dio);

  Future<Map?> login(LoginRequest data);
}

class LoginService extends ILoginService {
  LoginService(Dio dio) : super(dio);

  @override
  Future<Map?> login(LoginRequest data) async {
    final response = await dio.post(path, data: data);
    print('${json.encode(response.data)}');

    if (response.statusCode == HttpStatus.ok) {
      return response.data;
    }
    return null;
  }
}
