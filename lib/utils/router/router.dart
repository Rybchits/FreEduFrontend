import 'package:auto_route/auto_route.dart';
import 'package:freedu_frontend/presentation/pages/catalog/catalog_page.dart';
import 'package:freedu_frontend/presentation/pages/login/login_page.dart';
import 'package:freedu_frontend/presentation/pages/registration/registration_page.dart';


@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute( page: CatalogCoursesPage, name: 'CatalogCoursesPage', path: '/catalog', initial: true),
    AutoRoute( page: LoginPage, name: 'LoginPage', path: '/login'),
    AutoRoute(page: RegistrationPage, name: 'RegistrationPage', path: '/registration')
  ],
)
class $AppRouter {}