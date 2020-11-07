import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movingPictures/presentation/home/home.dart';

import '../../application/auth/auth_bloc.dart';
import '../../application/auth/user_profile/user_profile_bloc.dart';
import '../../injection.dart';
import '../routes/router.gr.dart';
import 'main_app_bar_widget.dart';
import 'main_bottom_navigation_bar_widget.dart';

class MainBodyLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<UserProfileBloc>()
            ..add(const UserProfileEvent.watchProfileStarted()),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              state.maybeMap(
                unAuthenticated: (_) => ExtendedNavigator.of(context)
                  ..pushAndRemoveUntil(Routes.signInScreen, (route) => false),
                orElse: () {},
              );
            },
          ),
        ],
        child: const Scaffold(
          appBar: MainAppBar(),
          body: Home(),
          bottomNavigationBar: MainBottomNavigationBar(),
        ),
      ),
    );
  }
}