import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/utils/colors.dart';

class TextStyleCustom{

  TextStyle? _textButton;
  TextStyle? _textTitle, _subTitle,_textAppbar,_textMovie;
  TextStyle? _textUnderline,_textYellow,_textIMDb,_textPopularMovie;

  TextStyleCustom(BuildContext context){
    TextTheme textTheme = Theme.of(context).textTheme;


    this._textButton    = textTheme.bodyText1!.copyWith(fontSize:16, fontWeight: FontWeight.w400);
    this._textPopularMovie    = textTheme.bodyText1!.copyWith(fontSize:34, color: whiteColor ,fontWeight: FontWeight.bold);
    this._textTitle     = textTheme.headline3!.copyWith(fontSize:26, color: Colors.white);
    this._textAppbar    = textTheme.headline3!.copyWith(fontSize:20, color: Colors.white, fontWeight: FontWeight.w200);
    this._textYellow    = textTheme.headline3!.copyWith(fontSize:20, color: yellowColor, fontWeight: FontWeight.w300);
    this._textIMDb      = textTheme.headline3!.copyWith(fontSize:12, color: greyColor, fontWeight: FontWeight.w100);
    this._textMovie     = textTheme.headline3!.copyWith(fontSize:20, color: Colors.white, fontWeight: FontWeight.w200);
    this._subTitle      = textTheme.headline3!.copyWith(fontSize:24, color: Colors.white, fontWeight: FontWeight.bold);
    this._textUnderline = textTheme.headline3!.copyWith(fontSize:18, color: Colors.white, decoration: TextDecoration.underline);
  }

  TextStyle? get textButton => this._textButton;
  TextStyle? get textPopularMovie => this._textPopularMovie;
  TextStyle? get textTitle => this._textTitle;
  TextStyle? get subTitle => this._subTitle;
  TextStyle? get textMovie => this._textMovie;
  TextStyle? get textUnderline => this._textUnderline;
  TextStyle? get textAppbar => this._textAppbar;
  TextStyle? get textYellow => this._textYellow;
  TextStyle? get textIMDb => this._textIMDb;

}