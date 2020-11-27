// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movingPictures/domain/home/movies/movie/movie.dart';

import '../../domain/auth/app_user.dart';
import '../../domain/home/movies/genres/genre.dart';
import '../home/movies/genre_movies_screen.dart';
import '../main_layout_appbar_navbar/main_body_layout.dart';
import '../movie_or_series_info/movie_or_series_info.dart';
import '../profile/profile_screen.dart';
import '../signin/sign_in_screen.dart';
import '../splash/splash_screen.dart';

class Routes {
  static const String splashScreen = '/';
  static const String signInScreen = '/sign-in-screen';
  static const String mainBodyLayout = '/main-body-layout';
  static const String profileScreen = '/profile-screen';
  static const String movieOrSeriesInfo = '/movie-or-series-info';
  static const String genreMoviesScreen = '/genre-movies-screen';
  static const all = <String>{
    splashScreen,
    signInScreen,
    mainBodyLayout,
    profileScreen,
    movieOrSeriesInfo,
    genreMoviesScreen,
  };
}

class AppRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashScreen, page: SplashScreen),
    RouteDef(Routes.signInScreen, page: SignInScreen),
    RouteDef(Routes.mainBodyLayout, page: MainBodyLayout),
    RouteDef(Routes.profileScreen, page: ProfileScreen),
    RouteDef(Routes.movieOrSeriesInfo, page: MovieOrSeriesInfo),
    RouteDef(Routes.genreMoviesScreen, page: GenreMoviesScreen),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    SplashScreen: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const SplashScreen(),
        settings: data,
      );
    },
    SignInScreen: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => SignInScreen(),
        settings: data,
      );
    },
    MainBodyLayout: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => MainBodyLayout(),
        settings: data,
      );
    },
    ProfileScreen: (data) {
      final args = data.getArgs<ProfileScreenArguments>(
        orElse: () => ProfileScreenArguments(),
      );
      return CupertinoPageRoute<dynamic>(
        builder: (context) => ProfileScreen(
          key: args.key,
          appTextTheme: args.appTextTheme,
          user: args.user,
        ),
        settings: data,
        fullscreenDialog: true,
      );
    },
    MovieOrSeriesInfo: (data) {
      final args = data.getArgs<MovieOrSeriesInfoArguments>(nullOk: false);
      return CupertinoPageRoute<dynamic>(
        builder: (context) => MovieOrSeriesInfo(
          key: args.key,
          movie: args.movie,
        ),
        settings: data,
        fullscreenDialog: true,
      );
    },
    GenreMoviesScreen: (data) {
      final args = data.getArgs<GenreMoviesScreenArguments>(nullOk: false);
      return CupertinoPageRoute<dynamic>(
        builder: (context) => GenreMoviesScreen(
          key: args.key,
          genre: args.genre,
        ),
        settings: data,
        fullscreenDialog: true,
      );
    },
  };
}

/// ************************************************************************
/// Navigation helper methods extension
/// *************************************************************************

extension AppRouterExtendedNavigatorStateX on ExtendedNavigatorState {
  Future<dynamic> pushSplashScreen() => push<dynamic>(Routes.splashScreen);

  Future<dynamic> pushSignInScreen() => push<dynamic>(Routes.signInScreen);

  Future<dynamic> pushMainBodyLayout() => push<dynamic>(Routes.mainBodyLayout);

  Future<dynamic> pushProfileScreen({
    Key key,
    TextTheme appTextTheme,
    AppUser user,
  }) =>
      push<dynamic>(
        Routes.profileScreen,
        arguments: ProfileScreenArguments(
            key: key, appTextTheme: appTextTheme, user: user),
      );

  Future<dynamic> pushMovieOrSeriesInfo({
    Key key,
    @required Movie movie,
  }) =>
      push<dynamic>(
        Routes.movieOrSeriesInfo,
        arguments: MovieOrSeriesInfoArguments(key: key, movie: movie),
      );

  Future<dynamic> pushGenreMoviesScreen({
    Key key,
    @required Genre genre,
  }) =>
      push<dynamic>(
        Routes.genreMoviesScreen,
        arguments: GenreMoviesScreenArguments(key: key, genre: genre),
      );
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// ProfileScreen arguments holder class
class ProfileScreenArguments {
  final Key key;
  final TextTheme appTextTheme;
  final AppUser user;
  ProfileScreenArguments({this.key, this.appTextTheme, this.user});
}

/// MovieOrSeriesInfo arguments holder class
class MovieOrSeriesInfoArguments {
  final Key key;
  final Movie movie;
  MovieOrSeriesInfoArguments({this.key, @required this.movie});
}

/// GenreMoviesScreen arguments holder class
class GenreMoviesScreenArguments {
  final Key key;
  final Genre genre;
  GenreMoviesScreenArguments({this.key, @required this.genre});
}
