// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../../presentation/pages/catalog/catalog_page.dart' as _i1;
import '../../presentation/pages/login/login_page.dart' as _i2;
import '../../presentation/pages/registration/registration_page.dart' as _i3;
import '../../presentation/pages/user_education/user_education_page.dart'
    as _i4;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    CatalogCoursesPage.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.CatalogCoursesPage());
    },
    LoginPage.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.LoginPage());
    },
    RegistrationPage.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.RegistrationPage());
    },
    UserEducationPage.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.UserEducationPage());
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig('/#redirect',
            path: '/', redirectTo: '/catalog', fullMatch: true),
        _i5.RouteConfig(CatalogCoursesPage.name, path: '/catalog'),
        _i5.RouteConfig(LoginPage.name, path: '/login'),
        _i5.RouteConfig(RegistrationPage.name, path: '/registration'),
        _i5.RouteConfig(UserEducationPage.name, path: '/my_education')
      ];
}

/// generated route for
/// [_i1.CatalogCoursesPage]
class CatalogCoursesPage extends _i5.PageRouteInfo<void> {
  const CatalogCoursesPage() : super(CatalogCoursesPage.name, path: '/catalog');

  static const String name = 'CatalogCoursesPage';
}

/// generated route for
/// [_i2.LoginPage]
class LoginPage extends _i5.PageRouteInfo<void> {
  const LoginPage() : super(LoginPage.name, path: '/login');

  static const String name = 'LoginPage';
}

/// generated route for
/// [_i3.RegistrationPage]
class RegistrationPage extends _i5.PageRouteInfo<void> {
  const RegistrationPage()
      : super(RegistrationPage.name, path: '/registration');

  static const String name = 'RegistrationPage';
}

/// generated route for
/// [_i4.UserEducationPage]
class UserEducationPage extends _i5.PageRouteInfo<void> {
  const UserEducationPage()
      : super(UserEducationPage.name, path: '/my_education');

  static const String name = 'UserEducationPage';
}
