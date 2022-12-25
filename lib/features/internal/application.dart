import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:good_phone/core/theme/custom_theme.dart';
import 'package:good_phone/core/main.dart';
import 'package:good_phone/features/presentation/home_page/bloc/home_bloc.dart';
import 'package:good_phone/features/presentation/home_page/pages/home.dart';
import '../../core/app_router.dart';

import 'package:good_phone/core/injection.dart' as inj;

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => inj.locator<HomeBloc>(),
        ),
      ],
      //   child: MaterialApp.router(
      //     debugShowCheckedModeBanner: false,
      //     routerConfig: router,
      //   ),
      // );

      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        theme: CustomTheme.lightTheme,
      ),
    );
  }
}
