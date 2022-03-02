
import 'package:flutter/material.dart';
import 'package:movie_app/utils/text_style.dart';

class SeeAll extends StatelessWidget {
  const SeeAll({
    Key? key,
    required this.textStyleCustom,
  }) : super(key: key);

  final TextStyleCustom textStyleCustom;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.only(top:8.0, bottom: 8.0),
        child: Text('See All', style: textStyleCustom.textYellow),
      ));
  }
}
