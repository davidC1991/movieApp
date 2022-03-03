import 'package:flutter/material.dart';
import 'package:movie_app/pages/details/widgets/menu_episode_widget.dart';
import 'package:movie_app/global_widgets/movie_video_card_widget.dart';
import 'package:movie_app/utils/colors.dart';
import 'package:movie_app/utils/responsive.dart';
import 'package:movie_app/utils/text_style.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive(context);
    TextStyleCustom textStyleCustom = TextStyleCustom(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('title movie',style: textStyleCustom.textAppbar),
        elevation: 0,
        leading: IconButton(
          onPressed: ()=> Navigator.pop(context),
          icon:  Icon(Icons.arrow_back_ios)
        ),
        actions: [
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.ac_unit_rounded, color: greyColor) 
          )
        ],
      ),
      body: SafeArea(
        child:Container(
          padding: EdgeInsets.all(18),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MenuEpisode(responsive: responsive, textStyleCustom: textStyleCustom),
              SizedBox(height: responsive.heightPercent(2)),
              MovieVideoCard(responsive: responsive),  
              SizedBox(height: responsive.heightPercent(9.5)),
              Text('Title movie', style: textStyleCustom.textTitle),
              SizedBox(height: responsive.heightPercent(2.5)),  
              Text('IMDB: 8,4 | 2019 | 1 Season', style: textStyleCustom.textIMDb),
              SizedBox(height: responsive.heightPercent(2.5)),
              Divider(color: greyColor.withOpacity(0.5)),
              SizedBox(height: responsive.heightPercent(2.5)),
              Text('Fuentes con estilo está creada con Motive para brindar un aspecto elegante al teléfono inteligente con fuentes atractivas. Tiene varias fuentes con vista previa instantánea para que puedas ver cómo se verá exactamente la fuente. NOTA: esta aplicación NO está patrocinada, respaldada ni afiliada a Monotype Imaging, Inc, el propietario de la marca comercial ni la tecnología FlipFont.',
                overflow: TextOverflow.ellipsis, textAlign: TextAlign.justify, maxLines: 7, style: textStyleCustom.textMovie),

            ],
          ),
        ) ,
      ),
    );
  }
}
