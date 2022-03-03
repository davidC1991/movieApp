 
 
 

import 'package:fluttertoast/fluttertoast.dart';
import 'package:movie_app/utils/colors.dart';

void mensajePantalla(String mensaje) {
           Fluttertoast.showToast(
                  msg: mensaje,
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.CENTER,
                  fontSize: 15,
                  backgroundColor: blackColor.withOpacity(0.7)
            );
}           