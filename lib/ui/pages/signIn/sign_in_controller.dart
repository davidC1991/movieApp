import 'package:flutter/foundation.dart';
import 'package:movie_app/data/repositories/auth_repository.dart';
import 'package:movie_app/data/repositories_implementation/auth_repository_impl.dart';
import 'package:movie_app/data/services/auth_service.dart';
import 'package:movie_app/preferences/auth_preference.dart';

class SignInController extends ChangeNotifier {
  String? _name, _password;
  
  AuthRepository authRepository = AuthRepositoryImpl(AuthService()); 
  final AuthPreference authPreference = AuthPreference();

  set name(String? name) {
    this._name = name;
    notifyListeners(); 
  }
  set password(String? password) {
    this._password = password;
    notifyListeners();
  } 
 
  String? get currentname    => this._name;
  String? get currentPassword => this._password;

  Future<bool> submit()async{
    print(this._name);
    print(this._password);
    if (this._name != null && this._password != null){
    final result = await authRepository.login(_name!, _password!);
      print(result);
      if (result!=null) {
        authPreference.setUserLogin = true;
        return true;
      }
    }
    return false;
    
  }

}