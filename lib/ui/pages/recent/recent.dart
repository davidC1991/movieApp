import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/data/models/airing_today_model.dart';
import 'package:movie_app/ui/global_controllers/service_api_controller.dart';
import 'package:movie_app/ui/pages/recent/widgets/recent_widget.dart';
import 'package:provider/provider.dart';

class RecentPage extends StatelessWidget {
  const RecentPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final ServiceApiController serviceApiController = Provider.of<ServiceApiController>(context, listen: false);
    return FutureBuilder(
      future: serviceApiController.getAiringTodayMovies(),
      builder: (BuildContext context, AsyncSnapshot<List<ResultAiringToday>?> snapshot) {
        if (snapshot.hasData){
          final List<ResultAiringToday> _listAiringMovies = snapshot.data!;
          return recentWidget(_listAiringMovies);
        }
        return Center(child: CupertinoActivityIndicator());
      },
    ); 
    
  }

  Container recentWidget(List<ResultAiringToday> listAiringMovies) {
    return Container(
    padding: EdgeInsets.all(18),
    alignment: Alignment.center,
    width: double.infinity,
    height: double.infinity,
    child: ListView.builder(
      
      itemCount: listAiringMovies.length,
      itemBuilder: ( _ , i) => RecentWidget(todayMovie: listAiringMovies[i])
    )
  );
  }

  
}
