import 'package:flutter/material.dart';
import 'package:freedu_frontend/models/course_class.dart';
import 'package:freedu_frontend/models/user_class.dart';
import 'package:freedu_frontend/presentation/widgets/courses_card.dart';
import 'package:freedu_frontend/presentation/widgets/grid_courses_cards.dart';
import 'package:freedu_frontend/presentation/widgets/search_field.dart';
import 'package:freedu_frontend/presentation/widgets/sidebar.dart';
import 'package:freedu_frontend/utils/style.dart';

class UserEducationPage extends StatefulWidget {
  const UserEducationPage({Key? key}) : super(key: key);

  @override
  _UserEducationPageState createState() => _UserEducationPageState();
}

class _UserEducationPageState extends State<UserEducationPage> {
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

    final _searchedGridCourses = Column(
      children: [
        SearchField(controller: _searchController, focus: _searchFocusNode),
        Expanded(child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: GridCoursesCards(courses: _courses, type: TypeCoursesCard.PROGRESS),
        ))
      ],
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(image: Style.mainBackgroundImage),
        child: Row(
          children: [
            const Expanded(child: Sidebar(), flex: 1),
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(90, 40, 90, 0),
                  child: _searchedGridCourses,
                ),
                flex: 5)
          ],
        ),
      ),
    );
  }
}
