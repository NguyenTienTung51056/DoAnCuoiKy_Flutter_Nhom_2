class Trip {
  late String city;
  late String place;
  late String date;
  late String time;
  late String nameGuide;
  late String guide;
  late String image;
  late bool finish;

  Trip(
      {required this.city,
        required this.place,
        required this.date,
        required this.time,
        required this.nameGuide,
        required this.guide,
        required this.image,
        required this.finish});
}