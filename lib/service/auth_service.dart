// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:io';

import 'package:dio/dio.dart';

import 'package:flutterpost/constants/api_path.dart';
import 'package:flutterpost/model/token_model.dart';
import 'package:flutterpost/model/user_model.dart';

abstract class IAuthService {
  final Dio dio;
  IAuthService({
    required this.dio,
  });
  Future<TokenModel?> authResponse(UserModel model);
}

class AuthService extends IAuthService {
  AuthService({required super.dio});

  @override
  Future<TokenModel?> authResponse(UserModel model) async {
    final request = await dio.post(
      "$apiPath/api/login",
      data: model,
      options: Options(contentType:Headers.jsonContentType)
    );
    if (request.statusCode == HttpStatus.ok) {
      return TokenModel.fromJson(request.data);
    }
    return null;
  }
}
