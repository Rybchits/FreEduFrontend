import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:freedu_frontend/models/course_class.dart';
import 'package:freedu_frontend/models/user_class.dart';
import 'package:freedu_frontend/presentation/widgets/action_button.dart';
import 'package:freedu_frontend/presentation/widgets/grid_courses_cards.dart';
import 'package:freedu_frontend/presentation/widgets/search_field.dart';
import 'package:freedu_frontend/presentation/widgets/sidebar.dart';
import 'package:freedu_frontend/utils/style.dart';

class CatalogCoursesPage extends StatefulWidget {
  const CatalogCoursesPage({Key? key}) : super(key: key);

  @override
  State<CatalogCoursesPage> createState() => _CatalogCoursesPageState();
}

class _CatalogCoursesPageState extends State<CatalogCoursesPage> {
  final _searchController = TextEditingController();
  final _searchFocusNode = FocusNode();

  final List<Course> _courses = [
    Course(name: "Давайте рисовать!", numberStudents: 8, creator: User(name: "Марат Гумеров"), tags: ["Искусство"]),
    Course(name: "Новый курс", numberStudents: 1000, tags: ["IT технологии"],
        image: "https://pajournal.com.ua/wp-content/uploads/2021/07/learning-2707.jpg"),
    Course(name: "Давайте рисовать!", numberStudents: 8, creator: User(name: "Марат Гумеров"), tags: ["Искусство"]),
    Course(name: "Новый курс", numberStudents: 1000, tags: ["IT технологии"],
        image: "https://pajournal.com.ua/wp-content/uploads/2021/07/learning-2707.jpg"),
    Course(name: "Давайте рисовать!", numberStudents: 8, creator: User(name: "Марат Гумеров"), tags: ["Искусство"]),
    Course(name: "Новый курс", numberStudents: 1000, tags: ["IT технологии"],
        image: "https://pajournal.com.ua/wp-content/uploads/2021/07/learning-2707.jpg"),
  ];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onFocusNodeEvent);
    _searchFocusNode.addListener(_onFocusNodeEvent);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  _onFocusNodeEvent() {
    setState(() {
      // Re-renders
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isAuth = true;

    final _searchedGridCourses = Column(
      children: [
        SizedBox( height: isAuth? 0 : 130 ),
        SearchField(controller: _searchController, focus: _searchFocusNode),
        Expanded(child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: GridCoursesCards(courses: _courses),
        ))
      ],
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: !isAuth? _appBar(context) : null,
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(image: Style.mainBackgroundImage),
        // Условие отрисовки экрана в зависимости от авторизации пользователя
        child: isAuth? Row(
          children: [
            const Expanded(child: Sidebar(), flex: 2),
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(90, 50, 90, 20),
                  child: _searchedGridCourses,
                ),
                flex: 9)
          ],
        ) :
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 270),
          alignment: Alignment.topCenter,
          child: _searchedGridCourses,
        ),
      ),
    );
  }
}

AppBar _appBar(BuildContext context) {
  final Color primaryColor = Theme.of(context).primaryColor;

  final loginButton = ActionButton( label: "Войти", color: primaryColor,
      onClick: () => AutoRouter.of(context).pushNamed("/login"));

  return AppBar(
    elevation: 0.0,
    toolbarHeight: 120,
    centerTitle: true,
    automaticallyImplyLeading: false,
    backgroundColor: Colors.white.withOpacity(0.0),
    title: Image.asset("assets/images/main_logo.jpg", height: 100),
    actions: [
      Padding(
        child: SizedBox(child: loginButton, width: 120),
        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 40),
      ),
    ],
  );
}
