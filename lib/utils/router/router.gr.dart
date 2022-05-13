// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../../presentation/pages/catalog/catalog_page.dart' as _i1;
import '../../presentation/pages/login/login_page.dart' as _i2;
import '../../presentation/pages/profile/profile_page.dart' as _i5;
import '../../presentation/pages/registration/registration_page.dart' as _i3;
import '../../presentation/pages/user_education/user_education_page.dart'
    as _i4;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    CatalogCoursesPage.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.CatalogCoursesPage());
    },
    LoginPage.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.LoginPage());
    },
    RegistrationPage.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.RegistrationPage());
    },
    UserEducationPage.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.UserEducationPage());
    },
    ProfilePage.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.ProfilePage());
    }
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig('/#redirect',
            path: '/', redirectTo: '/catalog', fullMatch: true),
        _i6.RouteConfig(CatalogCoursesPage.name, path: '/catalog'),
        _i6.RouteConfig(LoginPage.name, path: '/login'),
        _i6.RouteConfig(RegistrationPage.name, path: '/registration'),
        _i6.RouteConfig(UserEducationPage.name, path: '/my_education'),
        _i6.RouteConfig(ProfilePage.name, path: '/profile')
      ];
}

/// generated route for
/// [_i1.CatalogCoursesPage]
class CatalogCoursesPage extends _i6.PageRouteInfo<void> {
  const CatalogCoursesPage() : super(CatalogCoursesPage.name, path: '/catalog');

  static const String name = 'CatalogCoursesPage';
}

/// generated route for
/// [_i2.LoginPage]
class LoginPage extends _i6.PageRouteInfo<void> {
  const LoginPage() : super(LoginPage.name, path: '/login');

  static const String name = 'LoginPage';
}

/// generated route for
/// [_i3.RegistrationPage]
class RegistrationPage extends _i6.PageRouteInfo<void> {
  const RegistrationPage()
      : super(RegistrationPage.name, path: '/registration');

  static const String name = 'RegistrationPage';
}

/// generated route for
/// [_i4.UserEducationPage]
class UserEducationPage extends _i6.PageRouteInfo<void> {
  const UserEducationPage()
      : super(UserEducationPage.name, path: '/my_education');

  static const String name = 'UserEducationPage';
}

/// generated route for
/// [_i5.ProfilePage]
class ProfilePage extends _i6.PageRouteInfo<void> {
  const ProfilePage() : super(ProfilePage.name, path: '/profile');

  static const String name = 'ProfilePage';
}
