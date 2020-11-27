import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../domain/home/movies/movie/movie.dart';
import '../../core/app_colors.dart';
import '../../routes/router.gr.dart';

class GenresList extends StatelessWidget {
  final Movie movie;
  const GenresList({
    @required Key key,
    this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTextTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Wrap(
        alignment: WrapAlignment.center,
        runSpacing: 8.0,
        spacing: 0.8,
        children: movie.genres
            .map((genre) => GestureDetector(
                  onTap: () => ExtendedNavigator.of(context)
                      .pushGenreMoviesScreen(genre: genre),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5.0,
                      vertical: 2.0,
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 2.5),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.white),
                      borderRadius: BorderRadius.circular(3.0),
                    ),
                    child: Text(genre.name,
                        style: TextStyle(
                          fontFamily: appTextTheme.subtitle1.fontFamily,
                          fontWeight: FontWeight.w600,
                          color: appTextTheme.subtitle1.color,
                        )),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
