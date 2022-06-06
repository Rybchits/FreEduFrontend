// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;

import '../../presentation/pages/catalog/catalog_page.dart' as _i1;
import '../../presentation/pages/course/course_page.dart' as _i2;
import '../../presentation/pages/login/login_page.dart' as _i3;
import '../../presentation/pages/profile/profile_page.dart' as _i6;
import '../../presentation/pages/registration/registration_page.dart' as _i4;
import '../../presentation/pages/user_education/user_education_page.dart'
    as _i5;

class AppRouter extends _i7.RootStackRouter {
  AppRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    CatalogCoursesPage.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.CatalogCoursesPage());
    },
    CoursePage.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<CoursePageArgs>(
          orElse: () =>
              CoursePageArgs(courseId: pathParams.getInt('courseId')));
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.CoursePage(key: args.key, courseId: args.courseId));
    },
    LoginPage.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.LoginPage());
    },
    RegistrationPage.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.RegistrationPage());
    },
    UserEducationPage.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.UserEducationPage());
    },
    ProfilePage.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.ProfilePage());
    }
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig('/#redirect',
            path: '/', redirectTo: '/catalog', fullMatch: true),
        _i7.RouteConfig(CatalogCoursesPage.name, path: '/catalog'),
        _i7.RouteConfig(CoursePage.name, path: 'course/:courseId'),
        _i7.RouteConfig(LoginPage.name, path: '/login'),
        _i7.RouteConfig(RegistrationPage.name, path: '/registration'),
        _i7.RouteConfig(UserEducationPage.name, path: '/my_education'),
        _i7.RouteConfig(ProfilePage.name, path: '/profile')
      ];
}

/// generated route for
/// [_i1.CatalogCoursesPage]
class CatalogCoursesPage extends _i7.PageRouteInfo<void> {
  const CatalogCoursesPage() : super(CatalogCoursesPage.name, path: '/catalog');

  static const String name = 'CatalogCoursesPage';
}

/// generated route for
/// [_i2.CoursePage]
class CoursePage extends _i7.PageRouteInfo<CoursePageArgs> {
  CoursePage({_i8.Key? key, required int courseId})
      : super(CoursePage.name,
            path: 'course/:courseId',
            args: CoursePageArgs(key: key, courseId: courseId),
            rawPathParams: {'courseId': courseId});

  static const String name = 'CoursePage';
}

class CoursePageArgs {
  const CoursePageArgs({this.key, required this.courseId});

  final _i8.Key? key;

  final int courseId;

  @override
  String toString() {
    return 'CoursePageArgs{key: $key, courseId: $courseId}';
  }
}

/// generated route for
/// [_i3.LoginPage]
class LoginPage extends _i7.PageRouteInfo<void> {
  const LoginPage() : super(LoginPage.name, path: '/login');

  static const String name = 'LoginPage';
}

/// generated route for
/// [_i4.RegistrationPage]
class RegistrationPage extends _i7.PageRouteInfo<void> {
  const RegistrationPage()
      : super(RegistrationPage.name, path: '/registration');

  static const String name = 'RegistrationPage';
}

/// generated route for
/// [_i5.UserEducationPage]
class UserEducationPage extends _i7.PageRouteInfo<void> {
  const UserEducationPage()
      : super(UserEducationPage.name, path: '/my_education');

  static const String name = 'UserEducationPage';
}

/// generated route for
/// [_i6.ProfilePage]
class ProfilePage extends _i7.PageRouteInfo<void> {
  const ProfilePage() : super(ProfilePage.name, path: '/profile');

  static const String name = 'ProfilePage';
}
