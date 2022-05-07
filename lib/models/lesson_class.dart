class Lesson {
  int? id;
  String title;
  String info;
  String? urlVideo;
  bool isLearned;

  Lesson({this.id, this.title = "", this.info = "", this.urlVideo, this.isLearned = false});
}