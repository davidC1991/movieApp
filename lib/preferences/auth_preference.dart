import 'package:shared_preferences/shared_preferences.dart';

class AuthPreference {

  static final AuthPreference _instancia = new AuthPreference._internal();

  factory AuthPreference() {
    return _instancia;
  }

  AuthPreference._internal();

  late SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();

     
  }
    
   get isUserLogged {
    return _prefs.getBool('isAuthed') ?? false;
  }
  


  set setUserLogin( bool value ) {
    _prefs.setBool('isAuthed', value);
  }
  
  

 

}
