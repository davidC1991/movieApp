

import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/data/repositories/auth_repository.dart';
import 'package:movie_app/data/repositories/movies_repository.dart';
import 'package:movie_app/helpers/dependency_injection.dart';
import 'package:movie_app/helpers/get.dart';

void main(){
  DependencyInjection.initialize();
  test('Authentication',() async {
    
    final auth = Get.i.find<AuthRepository>();
    final isAuth = await auth.login('pedro', 'password');
    final name = isAuth!.name;
    final password = isAuth.password;
    expect(name, 'pedro');
    expect(password, 'password');

    final isAuth2 = await auth.login('maria', 'password');
    final name2 = isAuth2!.name;
    final password2 = isAuth2.password;
    expect(name2, 'maria');
    expect(password2, 'password');
  });

  test('apiService',()async{
    final moviesService = Get.i.find<MoviesRepository>();
   
    final listMovies = await moviesService.getPopularMovies();
    expect(listMovies!.isNotEmpty, true);

    final detailMovie = await moviesService.getDetailsMovies('11250');
    expect(detailMovie!.id.toString(), '11250');
  });

}