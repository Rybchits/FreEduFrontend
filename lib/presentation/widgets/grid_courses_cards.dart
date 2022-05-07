import 'package:flutter/material.dart';
import 'package:freedu_frontend/presentation/widgets/courses_card.dart';

class GridCoursesCards extends StatelessWidget {
  const GridCoursesCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 15,
        crossAxisSpacing: 10
      ),
      itemCount: 7,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return const CoursesCard();
      });
  }
}
