import 'package:flutter/material.dart';
import 'package:movie_app/ui/pages/signIn/sign_in_controller.dart';
import 'package:movie_app/ui/pages/signIn/widgets/input_fields_login.dart';
import 'package:movie_app/utils/responsive.dart';
import 'package:movie_app/utils/text_style.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('sign page start..');
    final Responsive responsive = Responsive.of(context);
    TextStyleCustom textStyleCustom = TextStyleCustom(context);
    final SignInController signInController = Provider.of<SignInController>(context);
    
    return Scaffold(
        body: SafeArea(
        child: Container(
         decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/witcher_3.JPG'),
              fit: BoxFit.cover,
              alignment: Alignment.center
            )
          ),
          child: InputFieldsLogin(responsive: responsive, signInController: signInController, textStyleCustom: textStyleCustom),
        ),
      ),
    );
  }
}
