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
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/cupertino.dart' as _i7;
import 'package:flutter/material.dart' as _i6;

import '../../features/presentation/favourite/page/favourite_page.dart' as _i3;
import '../../features/presentation/home/page/home_page.dart' as _i2;
import '../../features/presentation/product_detail/page/product_detail.dart'
    as _i4;
import '../theme/custom_nested_router/custom_nav_bar.dart' as _i1;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    CustomBottomNavigationBar.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.CustomBottomNavigationBar(),
      );
    },
    MainRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.MainPage(),
      );
    },
    FavouritePhoneRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.FavouritePhonePage(),
      );
    },
    DetailRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<DetailRouteArgs>(
          orElse: () => DetailRouteArgs(id: pathParams.getInt('id')));
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.DetailPage(
          key: args.key,
          id: args.id,
        ),
      );
    },
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(
          CustomBottomNavigationBar.name,
          path: '/',
          children: [
            _i5.RouteConfig(
              '#redirect',
              path: '',
              parent: CustomBottomNavigationBar.name,
              redirectTo: 'home/',
              fullMatch: true,
            ),
            _i5.RouteConfig(
              MainRoute.name,
              path: 'home/',
              parent: CustomBottomNavigationBar.name,
              children: [
                _i5.RouteConfig(
                  DetailRoute.name,
                  path: ':id',
                  parent: MainRoute.name,
                )
              ],
            ),
            _i5.RouteConfig(
              FavouritePhoneRoute.name,
              path: 'favourite/',
              parent: CustomBottomNavigationBar.name,
            ),
          ],
        )
      ];
}

/// generated route for
/// [_i1.CustomBottomNavigationBar]
class CustomBottomNavigationBar extends _i5.PageRouteInfo<void> {
  const CustomBottomNavigationBar({List<_i5.PageRouteInfo>? children})
      : super(
          CustomBottomNavigationBar.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'CustomBottomNavigationBar';
}

/// generated route for
/// [_i2.MainPage]
class MainRoute extends _i5.PageRouteInfo<void> {
  const MainRoute({List<_i5.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          path: 'home/',
          initialChildren: children,
        );

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i3.FavouritePhonePage]
class FavouritePhoneRoute extends _i5.PageRouteInfo<void> {
  const FavouritePhoneRoute()
      : super(
          FavouritePhoneRoute.name,
          path: 'favourite/',
        );

  static const String name = 'FavouritePhoneRoute';
}

/// generated route for
/// [_i4.DetailPage]
class DetailRoute extends _i5.PageRouteInfo<DetailRouteArgs> {
  DetailRoute({
    _i7.Key? key,
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

  final _i7.Key? key;

  final int id;

  @override
  String toString() {
    return 'DetailRouteArgs{key: $key, id: $id}';
  }
}
