import 'package:flutter/foundation.dart';
import 'package:movie_app/data/repositories/auth_repository.dart';
import 'package:movie_app/data/repositories_implementation/auth_repository_impl.dart';
import 'package:movie_app/data/services/auth_service.dart';

class SignInController extends ChangeNotifier {
  String? _email, _password;

  AuthRepository authRepository = AuthRepositoryImpl(AuthService()); 


  set email(String email) => this._email = email;
  set password(String password) => this._password = password;


  void submit()async{
    print(this._email);
    print(this._password);
    final result = await authRepository.login(_email!, _password!);
    print(result);
  }

}