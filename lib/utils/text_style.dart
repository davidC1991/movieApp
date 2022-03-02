import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextStyleCustom{

  TextStyle? _textButton;
  TextStyle? _textTitle;
  TextStyle? _textUnderline;

  TextStyleCustom(BuildContext context){
    TextTheme textTheme = Theme.of(context).textTheme;


    this._textButton =textTheme.bodyText1!.copyWith(fontSize:16);
    this._textTitle =textTheme.headline3!.copyWith(fontSize:26, color: Colors.white);
    this._textUnderline =textTheme.headline3!.copyWith(fontSize:18, color: Colors.white, decoration: TextDecoration.underline);
  }

  TextStyle? get textButton => this._textButton;
  TextStyle? get textTitle => this._textTitle;
  TextStyle? get textUnderline => this._textUnderline;

}