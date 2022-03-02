import 'package:flutter/material.dart';
import 'package:movie_app/pages/pageView/pageView_controller.dart';
import 'package:movie_app/pages/pageView/widgets/menuNavigationBar.dart';
import 'package:movie_app/utils/text_style.dart';
import 'package:provider/provider.dart';

class PageViewScreen extends StatelessWidget {
  const PageViewScreen({ Key? key }) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    TextStyleCustom textStyleCustom = TextStyleCustom(context);
    PageViewController pageViewController = Provider.of<PageViewController>(context, listen: false);
    return  Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text('Home',style:  textStyleCustom.textAppbar),
      ),
      body: PageView(
        controller: pageViewController.pageController,
        children: [
          Container(child: Center(child: Text('pagina 1')), width: double.infinity, height: double.infinity,),
          Container(child: Center(child: Text('pagina 2')), width: double.infinity, height: double.infinity,),
          Container(child: Center(child: Text('pagina 3')), width: double.infinity, height: double.infinity,),
          Container(child: Center(child: Text('pagina 4')), width: double.infinity, height: double.infinity,),
        ],
      ),
      bottomNavigationBar: MenuNavigationBar(),
    );
  }
}

