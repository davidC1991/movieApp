import 'package:movie_app/data/models/user_model.dart';

abstract class AuthRepository{
   Future<User?> login(String email, String password);
} 