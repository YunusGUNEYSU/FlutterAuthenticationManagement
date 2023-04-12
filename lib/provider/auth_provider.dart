// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutterpost/constants/token_enum.dart';

import 'package:flutterpost/model/user_model.dart';
import 'package:flutterpost/service/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
 
 String token="";
    final AuthService authService;
  AuthProvider({
    required this.authService,
  });
 

  Future<void> fetchAuth(String email,String password)async
  {
   final response=await authService.authResponse(UserModel(email: email, password: password));
   token=response?.token??"";
  
print(response?.token);
notifyListeners();
  }
  Future<void> cacheToken()async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
   
    sharedPreferences.setString(TokenEnum.token.toString()
    , token);
  }
  Future<String?> getToken()async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
   return sharedPreferences.getString(TokenEnum.token.toString());
   
  }
}
