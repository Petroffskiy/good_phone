import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:good_phone/core/theme/custom_theme.dart';
import 'package:good_phone/features/presentation/home/bloc/home_bloc.dart';

import 'package:good_phone/core/injection.dart' as inj;

import '../../core/router/router.gr.dart';



class Application extends StatelessWidget {
   Application({Key? key}): super(key: key);
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => inj.locator<HomeBloc>(),
        ),
      ] ,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: CustomTheme.lightTheme,
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
      ),
    );
  }
}
