import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:good_phone/features/presentation/product_detail/bloc/product_detail_bloc.dart';
import '../features/presentation/home/bloc/home_bloc.dart';
import 'injection.dart' as inj;


import 'router/router.gr.dart';

class Application extends StatelessWidget {
  Application({Key? key}) : super(key: key);
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => inj.locator<HomeBloc>()),
        BlocProvider(create:(_) => inj.locator<ProductDetailBloc>())
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
      ),
    );
  }
}
