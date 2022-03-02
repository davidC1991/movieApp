import 'package:flutter/material.dart';
import 'package:movie_app/global_widgets/input_text.dart';
import 'package:movie_app/global_widgets/rounded_button.dart';
import 'package:movie_app/pages/signIn/sign_in_controller.dart';
import 'package:movie_app/utils/colors.dart';
import 'package:movie_app/utils/responsive.dart';

import 'package:movie_app/utils/text_style.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    TextStyleCustom textStyleCustom = TextStyleCustom(context);
    final SignInController signInController = Provider.of<SignInController>(context);
    return Scaffold(
      //appBar: AppBar(),
      body: SafeArea(
        child: Container(
          //color: greyColor,
          // alignment: Alignment.bottomCenter,
          // width: double.infinity,
          // height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/witcher_3.JPG'),
              fit: BoxFit.cover,
              alignment: Alignment.center
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children:[
              Container(
                width: responsive.widthPercent(98),
                height: responsive.heightPercent(50),
                decoration: BoxDecoration(
                  color: blackColor.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(30)
                ),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topRight,
                      margin: EdgeInsets.only(top:15, right: 20),
                      
                      width: responsive.diagonalPercent(80),
                      height: responsive.heightPercent(5),
                      child: Icon(Icons.close, color: whiteColor,),
                    ),
                    InputText(
                      keyboardType: TextInputType.emailAddress,
                      validator: (text) {
                       
                        if (text.contains("@")) return '';
                        return "Invalid email";
                      },
                      labelText: "Email",
                      onChanged: (value){
                        signInController.email = value;
                      },
                    ),
                     InputText(
                      keyboardType: TextInputType.emailAddress,
                      validator: (text) {
                        print(text);
                        if (text.length > 6) return '';
                        return "Characters must be major 6";
                      },
                      labelText: "Password",
                      obscureText: true,
                      onChanged: (value){
                        print(value);
                        signInController.password = value;
                      },
                    ),
                     SizedBox(height: responsive.widthPercent(20)),
                     RoundedButton(
                      fullWidth: false,
                      backgroundColor: whiteColor,
                      width: responsive.widthPercent(45),
                      height: responsive.heightPercent(5),
                      label: 'Log in',
                      onPressed: (){
                        signInController.submit();
                      } 
                    ),
                  ],
                ),
            ),
           ]
          ),
        ),
      ),
    );
  }
}
