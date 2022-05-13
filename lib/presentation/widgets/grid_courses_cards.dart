import 'package:flutter/material.dart';
import 'package:freedu_frontend/models/course_class.dart';
import 'package:freedu_frontend/presentation/widgets/courses_card.dart';

class GridCoursesCards extends StatelessWidget {
  final List<Course> courses;
  final TypeCoursesCard type;

  const GridCoursesCards({Key? key, required this.courses, this.type = TypeCoursesCard.DEFAULT}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        int numberCardsInRow = 0;
        if (constraints.maxWidth > 1300) {
          numberCardsInRow = 4;
        } else if(constraints.maxWidth > 1000) {
          numberCardsInRow = 3;
        } else {
          numberCardsInRow = 2;
        }

        return GridView.builder(
            padding: const EdgeInsets.all(0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: MediaQuery.of(context).orientation == Orientation.landscape?
                numberCardsInRow : numberCardsInRow-1,
                mainAxisSpacing: 15,
                crossAxisSpacing: 10
            ),
            itemCount: courses.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return CoursesCard(course: courses[index], type: type);
            });
      }
    );
  }
}
