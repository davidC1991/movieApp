import 'package:flutter/material.dart';
import 'package:movie_app/utils/text_style.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyleCustom textStyleCustom = TextStyleCustom(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text('Home',style:  textStyleCustom.textAppbar),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(15),
          alignment: Alignment.topLeft,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
             Text('Popular', style: textStyleCustom.subTitle),   
            ],
          ),
        ),
      )
    );
  }
}