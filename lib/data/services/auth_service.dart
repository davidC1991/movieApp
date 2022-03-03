import 'package:movie_app/data/models/user_model.dart';

class AuthService {
 
  Future<User?> login(String name, String password) async {
    if (name == 'maria' && password == 'password'){
      return User(name: name, password: password);
    }

    if (name == 'pedro' && password == 'password'){
      return User(name: name, password: password);
    }

    return null;
  }


}