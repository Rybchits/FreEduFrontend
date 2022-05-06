// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../../presentation/pages/login/login_page.dart' as _i1;
import '../../presentation/pages/registration/registration_page.dart' as _i2;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.LoginPage());
    },
    RegistrationPage.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.RegistrationPage());
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig('/#redirect',
            path: '/', redirectTo: '/login', fullMatch: true),
        _i3.RouteConfig(HomeRoute.name, path: '/login'),
        _i3.RouteConfig(RegistrationPage.name, path: '/registration')
      ];
}

/// generated route for
/// [_i1.LoginPage]
class HomeRoute extends _i3.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/login');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.RegistrationPage]
class RegistrationPage extends _i3.PageRouteInfo<void> {
  const RegistrationPage()
      : super(RegistrationPage.name, path: '/registration');

  static const String name = 'RegistrationPage';
}
