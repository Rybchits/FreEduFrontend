import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:freedu_frontend/models/course_class.dart';
import 'package:freedu_frontend/utils/router/router.gr.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

enum TypeCoursesCard { DEFAULT, EDIT, PROGRESS }

class CoursesCard extends StatelessWidget {
  final Course course;
  final TypeCoursesCard type;

  const CoursesCard({Key? key, required this.course, this.type = TypeCoursesCard.DEFAULT}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;
    final Color secondaryColor = Theme.of(context).primaryColorLight;

    Widget buildChip(String label) {
      return Chip(
        label: Text(
          label,
          style: GoogleFonts.montserrat(color: Colors.white, fontSize: 14),
        ),
        backgroundColor: secondaryColor,
        elevation: 2.0,
        shadowColor: Colors.grey[60],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      );
    }

    final Widget additionalInformation = type == TypeCoursesCard.PROGRESS
        ? LinearPercentIndicator(
            animation: true,
            animationDuration: 1500,
            lineHeight: 15.0,
            percent: 0.5,
            padding: EdgeInsets.zero,
            barRadius: const Radius.circular(20),
            trailing: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text("50 %",
                  style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w600, color: primaryColor)),
            ),
            progressColor: primaryColor.withOpacity(0.8 * 0.5),
            backgroundColor: Colors.grey.withOpacity(0.2),
          )
        : Row(mainAxisSize: MainAxisSize.max, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("Автор: ${course.creator?.name ?? "не указан"}",
                style: GoogleFonts.montserrat(fontSize: 14.0, color: primaryColor, fontWeight: FontWeight.w400)),
            Row(children: [
              Icon(Icons.person, color: primaryColor, size: 22),
              Text(course.numberStudents.toString(),
                  style: GoogleFonts.montserrat(fontSize: 14.0, color: primaryColor, fontWeight: FontWeight.w500)),
            ])
          ]);

    return GestureDetector(
      onTap: () => context.pushRoute(CoursePage(courseId: course.id ?? 0)),
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
              child: Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.all(5.0),
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
              flex: 13),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(course.name,
                        style: GoogleFonts.montserrat(fontSize: 18.0, color: primaryColor, fontWeight: FontWeight.w600)),
                    Container(
                      margin: const EdgeInsets.only(top: 5, bottom: 15),
                      child: buildChip(course.tags.first),
                    ),
                    additionalInformation,
                  ],
                ),
              ),
              flex: 7)
        ]),
      ),
    );
  }
}
