import 'package:movie_app/data/models/user_model.dart';
import 'package:movie_app/data/repositories/auth_repository.dart';
import 'package:movie_app/data/services/auth_service.dart';

class AuthRepositoryImpl implements AuthRepository{
  
  AuthService? authService;

  AuthRepositoryImpl(this.authService);

  @override
  Future<User?> login(String email, String password) {
    return authService!.login(email, password);
  }

}