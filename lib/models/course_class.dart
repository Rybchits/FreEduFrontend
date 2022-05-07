import 'package:freedu_frontend/models/lesson_class.dart';

import 'user_class.dart';

class Course {
  int? id;
  String name;
  String audience;
  String initialSkills;
  int numberStudents;
  List<String> tags;
  List<Lesson> lessons;
  String? image;
  User? creator;

  Course({
    this.id,
    this.name = "",
    this.audience = "",
    this.initialSkills = "",
    this.creator,
    this.image,
    this.tags = const [],
    this.lessons = const [],
    this.numberStudents = 0
  });
}