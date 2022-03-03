import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/utils/colors.dart';
import 'package:movie_app/utils/text_style.dart';



class RoundedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final Color textColor, backgroundColor, borderColor;
  final bool fullWidth;
  final EdgeInsets padding;
  final double? fontSize;
  final double width, height;
  final bool isValidated;
  const RoundedButton({
    Key? key,
    required this.onPressed,
    required this.label,
    this.textColor = Colors.white,
    this.backgroundColor = yellowColor,
    this.borderColor = whiteColor,
    this.fullWidth = true,
    this.padding = const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
    this.fontSize,
    required this.width,
    required this.height,
    this.isValidated : true
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyleCustom textStyleCustom = TextStyleCustom(context);
    return CupertinoButton(
      child: Container(
        alignment: Alignment.center,
        width: this.fullWidth ? double.infinity : this.width,
        height: this.height,
        padding: this.padding,
        decoration: BoxDecoration(
          color:  this.isValidated?this.backgroundColor:greyColor,
          borderRadius: BorderRadius.circular(30),
          
        ),
        child: Text(
          this.label,
          textAlign: TextAlign.center,
          style: textStyleCustom.textButton,
        ),
      ),
      minSize: 30,
      padding: EdgeInsets.zero,
      onPressed: this.isValidated?this.onPressed:null,
    );
  }
}
