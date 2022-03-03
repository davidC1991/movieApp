
import 'package:flutter/material.dart';
import 'package:movie_app/utils/responsive.dart';
import 'package:movie_app/utils/text_style.dart';

class MenuEpisode extends StatelessWidget {
  const MenuEpisode({
    Key? key,
    required this.responsive,
    required this.textStyleCustom,
  }) : super(key: key);

  final Responsive responsive;
  final TextStyleCustom textStyleCustom;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: responsive.widthPercent(90),
      height: responsive.heightPercent(4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('1 Episode', style: textStyleCustom.textTitle),  
          Text('Next', style: textStyleCustom.textAppbar)  
       ],
     ),
    );
  }
}
