

import 'package:movie_app/data/repositories/auth_repository.dart';
import 'package:movie_app/data/repositories/movies_repository.dart';
import 'package:movie_app/data/repositories_implementation/auth_repository_impl.dart';
import 'package:movie_app/data/repositories_implementation/movies_repository_impl.dart';
import 'package:movie_app/data/services/auth_service.dart';
import 'package:movie_app/data/services/movies_service.dart';
import 'package:movie_app/helpers/get.dart';

abstract class DependencyInjection {
  static void initialize() {
    final AuthRepository authenticationRepository = AuthRepositoryImpl(
      AuthService(),
    );

    final MoviesRepository moviesRepository = MovieRepositoryimpl(
      MoviesService(),
    );

    Get.i.put<AuthRepository>(authenticationRepository);
    Get.i.put<MoviesRepository>(moviesRepository);
    
  }
}
