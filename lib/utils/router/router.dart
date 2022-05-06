import 'package:auto_route/auto_route.dart';
import 'package:freedu_frontend/presentation/pages/login/login_page.dart';
import 'package:freedu_frontend/presentation/pages/registration/registration_page.dart';


@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute( page: LoginPage, name: 'HomeRoute', path: '/login', initial: true),
    AutoRoute(page: RegistrationPage, name: 'RegistrationPage', path: '/registration')
  ],
)
class $AppRouter {}