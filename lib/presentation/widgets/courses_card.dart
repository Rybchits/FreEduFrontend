import 'package:flutter/material.dart';
import 'package:freedu_frontend/models/course_class.dart';
import 'package:google_fonts/google_fonts.dart';

class CoursesCard extends StatelessWidget {
  final Course course;

  const CoursesCard({Key? key, required this.course}) : super(key: key);

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

    return Card(
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
                    margin: const EdgeInsets.only(top: 5, bottom: 10),
                    child: buildChip(course.tags.first),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Автор: ${course.creator?.name ?? "не указан"}",
                          style:
                              GoogleFonts.montserrat(fontSize: 14.0, color: primaryColor, fontWeight: FontWeight.w400)),
                      Row(children: [
                        Icon(Icons.person, color: primaryColor, size: 22),
                        Text(course.numberStudents.toString(),
                            style: GoogleFonts.montserrat(
                                fontSize: 14.0, color: primaryColor, fontWeight: FontWeight.w500)),
                      ])
                    ],
                  ),
                ],
              ),
            ),
            flex: 7)
      ]),
    );
  }
}
