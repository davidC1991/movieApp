import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextStyleCustom{

  TextStyle? _textButton;
  TextStyle? _textTitle, _subTitle,_textAppbar;
  TextStyle? _textUnderline;

  TextStyleCustom(BuildContext context){
    TextTheme textTheme = Theme.of(context).textTheme;


    this._textButton    = textTheme.bodyText1!.copyWith(fontSize:16);
    this._textTitle     = textTheme.headline3!.copyWith(fontSize:26, color: Colors.white);
    this._textAppbar    = textTheme.headline3!.copyWith(fontSize:20, color: Colors.white, fontWeight: FontWeight.w200);
    this._subTitle      = textTheme.headline3!.copyWith(fontSize:24, color: Colors.white, fontWeight: FontWeight.bold);
    this._textUnderline = textTheme.headline3!.copyWith(fontSize:18, color: Colors.white, decoration: TextDecoration.underline);
  }

  TextStyle? get textButton => this._textButton;
  TextStyle? get textTitle => this._textTitle;
  TextStyle? get subTitle => this._subTitle;
  TextStyle? get textUnderline => this._textUnderline;
  TextStyle? get textAppbar => this._textAppbar;

}