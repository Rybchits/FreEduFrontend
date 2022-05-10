import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);

  final routes = const [
    {"title": "каталог курсов", "route": "/catalog", "name": "CatalogCoursesPage"},
    {"title": "мое обучение", "route": "/catalog", "name": ""},
    {"title": "профиль", "route": "/catalog", "name": ""},
    {"title": "преподавание", "route": "/catalog", "name": ""}
  ];

  @override
  Widget build(BuildContext context) {
    final Color selectedColor = Theme.of(context).primaryColor;
    final Color notSelectedColor = Theme.of(context).secondaryHeaderColor;

    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Image.asset("assets/images/main_logo.jpg", height: 90),
        ),
        Expanded(
          child: Container(
            child: ListView.builder(
              itemCount: routes.length,
              itemBuilder: (context, index) =>
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                    title: Text(
                      routes[index]["title"]!,
                      style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, fontSize: 18, letterSpacing: 0.2),
                    ),
                    onTap: () {},
                    selected: ModalRoute.of(context)?.settings.name == routes[index]["name"]!,
                    textColor: notSelectedColor,
                    selectedColor: selectedColor,
                  ),
            ),
            margin: const EdgeInsets.only(bottom: 50),
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(width: 1.5, color: selectedColor.withOpacity(0.2)),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
