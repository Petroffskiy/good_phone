// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:auto_route/empty_router_widgets.dart' as _i1;
import 'package:flutter/cupertino.dart' as _i8;
import 'package:flutter/material.dart' as _i7;

import '../../features/presentation/favourite/page/favourite_page.dart' as _i4;
import '../../features/presentation/home/page/home_page.dart' as _i5;
import '../../features/presentation/product_detail/page/product_detail.dart'
    as _i3;
import '../main_page.dart' as _i2;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    ParentRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.EmptyRouterPage(),
      );
    },
    StartRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.StartPage(),
      );
    },
    DetailRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<DetailRouteArgs>(
          orElse: () => DetailRouteArgs(id: pathParams.getInt('id')));
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.DetailPage(
          key: args.key,
          id: args.id,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.EmptyRouterPage(),
      );
    },
    FavouritePhoneRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.FavouritePhonePage(),
      );
    },
    MainRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.MainPage(),
      );
    },
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(
          ParentRoute.name,
          path: '/',
          children: [
            _i6.RouteConfig(
              '#redirect',
              path: '',
              parent: ParentRoute.name,
              redirectTo: 'start/',
              fullMatch: true,
            ),
            _i6.RouteConfig(
              StartRoute.name,
              path: 'start/',
              parent: ParentRoute.name,
              children: [
                _i6.RouteConfig(
                  HomeRoute.name,
                  path: 'home/',
                  parent: StartRoute.name,
                  children: [
                    _i6.RouteConfig(
                      MainRoute.name,
                      path: '',
                      parent: HomeRoute.name,
                    )
                  ],
                ),
                _i6.RouteConfig(
                  FavouritePhoneRoute.name,
                  path: 'favourite/',
                  parent: StartRoute.name,
                ),
              ],
            ),
            _i6.RouteConfig(
              DetailRoute.name,
              path: ':id',
              parent: ParentRoute.name,
            ),
          ],
        )
      ];
}

/// generated route for
/// [_i1.EmptyRouterPage]
class ParentRoute extends _i6.PageRouteInfo<void> {
  const ParentRoute({List<_i6.PageRouteInfo>? children})
      : super(
          ParentRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'ParentRoute';
}

/// generated route for
/// [_i2.StartPage]
class StartRoute extends _i6.PageRouteInfo<void> {
  const StartRoute({List<_i6.PageRouteInfo>? children})
      : super(
          StartRoute.name,
          path: 'start/',
          initialChildren: children,
        );

  static const String name = 'StartRoute';
}

/// generated route for
/// [_i3.DetailPage]
class DetailRoute extends _i6.PageRouteInfo<DetailRouteArgs> {
  DetailRoute({
    _i8.Key? key,
    required int id,
  }) : super(
          DetailRoute.name,
          path: ':id',
          args: DetailRouteArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'id': id},
        );

  static const String name = 'DetailRoute';
}

class DetailRouteArgs {
  const DetailRouteArgs({
    this.key,
    required this.id,
  });

  final _i8.Key? key;

  final int id;

  @override
  String toString() {
    return 'DetailRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i1.EmptyRouterPage]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          path: 'home/',
          initialChildren: children,
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i4.FavouritePhonePage]
class FavouritePhoneRoute extends _i6.PageRouteInfo<void> {
  const FavouritePhoneRoute()
      : super(
          FavouritePhoneRoute.name,
          path: 'favourite/',
        );

  static const String name = 'FavouritePhoneRoute';
}

/// generated route for
/// [_i5.MainPage]
class MainRoute extends _i6.PageRouteInfo<void> {
  const MainRoute()
      : super(
          MainRoute.name,
          path: '',
        );

  static const String name = 'MainRoute';
}
