import 'package:flutter/material.dart';
import 'package:movingPictures/presentation/core/app_colors.dart';
import 'package:movingPictures/presentation/core/constants/language_constants.dart';
import 'package:movingPictures/presentation/home/movies/movies_tab_screen.dart';
import 'package:movingPictures/presentation/home/series/series_tab_screen.dart';

class Home extends StatelessWidget {
  final TextTheme appTextTheme;

  final TabController tabController;

  const Home({
    Key key,
    this.tabController,
    this.appTextTheme,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final appTextTheme = Theme.of(context).textTheme;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: TabBar(
          controller: tabController,
          indicatorColor: AppColors.red,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorWeight: 3.0,
          labelColor: appTextTheme.bodyText1.color,
          unselectedLabelColor: AppColors.white.withOpacity(0.5),
          tabs: [
            SizedBox(
              height: 30.0,
              width: 50.0,
              child: Center(child: Text(movies.toUpperCase())),
            ),
            SizedBox(
              height: 30.0,
              width: 50.0,
              child: Center(child: Text(series.toUpperCase())),
            ),
          ],
        ),
        body: TabBarView(
          controller: tabController,
          physics: const BouncingScrollPhysics(),
          children: const [
            MoviesTabScreen(),
            SeriesTabScreen(),
          ],
        ),
      ),
    );
  }
}
