import 'package:flutter/material.dart';
import 'package:movie_app/ui/global_widgets/input_text.dart';
import 'package:movie_app/ui/global_widgets/rounded_button.dart';
import 'package:movie_app/ui/pages/signIn/sign_in_controller.dart';
import 'package:movie_app/utils/colors.dart';
import 'package:movie_app/utils/dialogs.dart';
import 'package:movie_app/utils/responsive.dart';
import 'package:movie_app/utils/text_style.dart';

class InputFieldsLogin extends StatelessWidget {
  const InputFieldsLogin({
    Key? key,
    required this.responsive,
    required this.signInController,
    required this.textStyleCustom,
  }) : super(key: key);

  final Responsive responsive;
  final SignInController signInController;
  final TextStyleCustom textStyleCustom;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children:[
        Container(
          width: responsive.widthPercent(98),
          height: responsive.heightPercent(50),
          decoration: BoxDecoration(
            color: blackColor.withOpacity(0.9),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))
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
                 
                  if (text.length>4) return '';
                  return "Characters must be greater 4";
                },
                labelText: "Name",
                onChanged: (value){
                  signInController.name = value;
                },
              ),
               InputText(
                keyboardType: TextInputType.emailAddress,
                validator: (text) {
                 if (text.length > 6) return '';
                 return "Characters must be greater 6";
                },
                labelText: "Password",
                obscureText: true,
                onChanged: (value){
                  //print(value);
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
                isValidated: signInController.currentname != null && signInController.currentPassword != null?true: false,
                onPressed: ()async{
                  ProgressDialog.show(context);
                  final isAuthed = await signInController.submit();
                  Navigator.pop(context);
                  if (isAuthed) {
                    Navigator.pushNamedAndRemoveUntil(context, 'pageView', (route) => false);  
                  }else{
                     showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                      backgroundColor: blackColor.withOpacity(0.7),
                      title: Text("ERROR", style: textStyleCustom.subTitle,),
                      content: Text("Invalid name or password", style: textStyleCustom.textAppbar,),
                      ),
                    );
                  }
                } 
              ),
            ],
          ),
      ),
     ]
    );
  }
}
