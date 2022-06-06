import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freedu_frontend/models/course_class.dart';
import 'package:freedu_frontend/presentation/widgets/action_button.dart';
import 'package:freedu_frontend/presentation/widgets/scroll_view_with_scrollbars.dart';
import 'package:freedu_frontend/presentation/widgets/sidebar.dart';
import 'package:freedu_frontend/providers/auth_provider.dart';
import 'package:freedu_frontend/providers/courses_provider.dart';
import 'package:freedu_frontend/utils/style.dart';
import 'package:google_fonts/google_fonts.dart';

class CoursePage extends ConsumerStatefulWidget {
  final int courseId;
  const CoursePage({Key? key, @PathParam('courseId') required this.courseId}) : super(key: key);

  @override
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends ConsumerState<CoursePage> {
  late final Course? currentCourse = ref.watch(listCoursesState)?.where((element) => element.id == widget.courseId).first;

  @override
  Widget build(BuildContext context) {
    bool isAuth = ref.watch(authUserState) != null;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: !isAuth ? _appBar(context) : null,
      body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(image: Style.mainBackgroundImage),
          child: Row(
            children: [
              // Условие отрисовки экрана в зависимости от авторизации пользователя
              Expanded(child: isAuth ? const Sidebar() : const SizedBox(), flex: 1),
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 90),
                    child: Column(
                      children: [
                        SizedBox(height: !isAuth? 60 : 0),
                        _courseInfo(context, currentCourse ?? Course()),
                      ],
                    )),
                flex: 5,
              )
            ],
          )),
    );
  }
}

AppBar _appBar(BuildContext context) {
  final Color primaryColor = Theme.of(context).primaryColor;

  final loginButton =
      ActionButton(label: "Войти", color: primaryColor, onClick: () => AutoRouter.of(context).pushNamed("/login"));

  return AppBar(
    elevation: 0.0,
    toolbarHeight: 120,
    automaticallyImplyLeading: false,
    backgroundColor: Colors.white.withOpacity(0.0),
    title: Image.asset("assets/images/main_logo.jpg", height: 80),
    actions: [
      Padding(
        child: SizedBox(child: loginButton, width: 120),
        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 40),
      ),
    ],
  );
}

Widget _courseInfo(BuildContext context, Course course) {
  final Color primaryColor = Theme.of(context).primaryColor;

  final nameRow = Row(children: [
    Text(course.name,
        style: GoogleFonts.montserrat( fontWeight: FontWeight.w600, fontSize: 32, color: primaryColor),
    ),
    Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Text("Автор: " + (course.creator?.name ?? "Не указан"),
            style: GoogleFonts.montserrat(fontSize: 16, color: primaryColor)))],
    crossAxisAlignment: CrossAxisAlignment.end,
  );

  return ScrollViewWithScrollbars(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: nameRow,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 200, width: 300,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: FadeInImage.assetNetwork(
                  placeholder: "assets/images/default-course-image.jpg",
                  image: course.image ?? "",
                  imageErrorBuilder: (context, error, stackTrace) =>
                      Image.asset("assets/images/default-course-image.jpg"),
                ),
              ),
            ),
            const SizedBox(width: 30),
            Flexible(child: _paragraphWithTitle(context, "Описание", course.description)),
          ],
        ),
        _paragraphWithTitle(context, "Для кого этот курс", course.audience),
        _paragraphWithTitle(context, "Начальные знания", course.initialSkills)
      ],
    ),
  );
}

Widget _paragraphWithTitle(BuildContext context, String title, String paragraphText) {
  final Color primaryColor = Theme.of(context).primaryColor;

  return Container(
    color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: GoogleFonts.montserrat(fontSize: 24, fontWeight: FontWeight.w600, color: primaryColor)),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 30),
            child: Text(
              paragraphText,
              maxLines: 10,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.justify,
              style: GoogleFonts.montserrat(fontSize: 18)),
          )
        ]),
  );
}
