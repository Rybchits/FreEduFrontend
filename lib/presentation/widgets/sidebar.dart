import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);

  final routes = const [
    {"title": "каталог курсов", "route": "/catalog", "name": "CatalogCoursesPage"},
    {"title": "мое обучение", "route": "/my_education", "name": "UserEducationPage"},
    {"title": "профиль", "route": "/profile", "name": "ProfilePage"},
    {"title": "преподавание", "route": "/catalog", "name": ""}
  ];

  @override
  Widget build(BuildContext context) {
    final Color selectedColor = Theme.of(context).primaryColor;
    final Color notSelectedColor = Theme.of(context).secondaryHeaderColor;

    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          right: BorderSide(width: 1.5, color: selectedColor.withOpacity(0.2)),
        ),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 25, 16, 10),
          child: Image.asset("assets/images/main_logo.jpg", height: 60),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: routes.length,
            itemBuilder: (context, index) => ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
              title: Text(
                routes[index]["title"]!,
                style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, fontSize: 18, letterSpacing: 0.2),
              ),
              onTap: () => AutoRouter.of(context).pushNamed(routes[index]["route"]!),
              selected: ModalRoute.of(context)?.settings.name == routes[index]["name"]!,
              textColor: notSelectedColor,
              selectedColor: selectedColor,
            ),
          ),
        )
      ]),
    );
  }
}
