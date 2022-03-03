import 'package:flutter/material.dart';
import 'package:movie_app/ui/global_widgets/rounded_button.dart';
import 'package:movie_app/utils/colors.dart';
import 'package:movie_app/utils/responsive.dart';

import 'package:movie_app/utils/text_style.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({ Key? key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    TextStyleCustom textStyleCustom = TextStyleCustom(context);
    return Scaffold(
      //appBar: AppBar(),
      body: SafeArea(
        child: Container(
          //color: greyColor,
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/witcher_3.JPG'),
              fit: BoxFit.cover,
              alignment: Alignment.center
            )
          ),
          child: Column(
              children:[
              Padding(
                padding: EdgeInsets.only(top:responsive.heightPercent(10)),
                child: Text('Welcome!', style: textStyleCustom.textTitle),
              ),
              SizedBox(height: responsive.heightPercent(35)),
              RoundedButton(
                fullWidth: false,
                width: responsive.widthPercent(45),
                height: responsive.heightPercent(5),
                label: 'Sign up',
                onPressed: (){}
              ),
              SizedBox(height: responsive.widthPercent(5)),
              RoundedButton(
                fullWidth: false,
                backgroundColor: whiteColor,
                width: responsive.widthPercent(45),
                height: responsive.heightPercent(5),
                label: 'Log in',
                onPressed: (){
                  Navigator.pushNamedAndRemoveUntil(context, 'signIn', (route) => false);
                } 
              ),
              SizedBox(height: responsive.heightPercent(5)),
              Text('Forgot password?', style: textStyleCustom.textUnderline,)
            ]
          ),
        ),
      ),
    );
  }
}
