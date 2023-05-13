

class AllBookingModel {
  String id;
  String bookDate;
  String bookSlot;
  String showStartTime;
  String showEndTime;
  String soundCheckTime;
  String mainCourse;
  String starter;
  String nonAlcoholic;
  String alcoholic;
  String formation;
  String genres;

  AllBookingModel({
    required this.id,
    required this.bookDate,
    required this.bookSlot,
    required this.showStartTime,
    required this.showEndTime,
    required this.soundCheckTime,
    required this.mainCourse,
    required this.starter,
    required this.nonAlcoholic,
    required this.alcoholic,
    required this.formation,
    required this.genres,
  });
}