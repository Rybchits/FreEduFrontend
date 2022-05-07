// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../../presentation/pages/catalog/catalog_page.dart' as _i1;
import '../../presentation/pages/login/login_page.dart' as _i2;
import '../../presentation/pages/registration/registration_page.dart' as _i3;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    CatalogCoursesPage.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.CatalogCoursesPage());
    },
    LoginPage.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.LoginPage());
    },
    RegistrationPage.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.RegistrationPage());
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig('/#redirect',
            path: '/', redirectTo: '/catalog', fullMatch: true),
        _i4.RouteConfig(CatalogCoursesPage.name, path: '/catalog'),
        _i4.RouteConfig(LoginPage.name, path: '/login'),
        _i4.RouteConfig(RegistrationPage.name, path: '/registration')
      ];
}

/// generated route for
/// [_i1.CatalogCoursesPage]
class CatalogCoursesPage extends _i4.PageRouteInfo<void> {
  const CatalogCoursesPage() : super(CatalogCoursesPage.name, path: '/catalog');

  static const String name = 'CatalogCoursesPage';
}

/// generated route for
/// [_i2.LoginPage]
class LoginPage extends _i4.PageRouteInfo<void> {
  const LoginPage() : super(LoginPage.name, path: '/login');

  static const String name = 'LoginPage';
}

/// generated route for
/// [_i3.RegistrationPage]
class RegistrationPage extends _i4.PageRouteInfo<void> {
  const RegistrationPage()
      : super(RegistrationPage.name, path: '/registration');

  static const String name = 'RegistrationPage';
}
