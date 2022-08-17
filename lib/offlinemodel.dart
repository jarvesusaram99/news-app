class PlaceLocation {
  final double test;

  const PlaceLocation({
     required this.test,
  });
}

class Place {
  final String id;
  final String heading;
  final String date;
    final String image;
    final String description;
        final String authorr;


  Place({
     required this.id,
     required this.date,
    required this.image,
    required this.description,
    required this.authorr,
    required this.heading

  });
}
