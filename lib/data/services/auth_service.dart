import 'package:movie_app/data/models/user_model.dart';

class AuthService {
 
  Future<User?> login(String email, String password) async {
    if (email == 'test@' && password == '123456789'){
      return User(email: email, password: password);
    }

    return null;
  }


}