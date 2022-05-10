import 'package:flutter/material.dart';
import 'package:freedu_frontend/models/course_class.dart';
import 'package:freedu_frontend/presentation/widgets/courses_card.dart';

class GridCoursesCards extends StatelessWidget {
  final List<Course> courses;
  final TypeCoursesCard type;

  const GridCoursesCards({Key? key, required this.courses, this.type = TypeCoursesCard.DEFAULT}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 15,
        crossAxisSpacing: 10
      ),
      itemCount: courses.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return CoursesCard(course: courses[index], type: type);
      });
  }
}
