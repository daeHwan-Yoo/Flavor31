class Location {
  final double latitude;
  final double longitude;
  final String name;

  Location({
    required this.latitude,
    required this.longitude,
    required this.name,
  });
}

class Flavor {
  final String name;
  final String description;
  final String imageUrl;

  Flavor({
    required this.name,
    required this.description,
    required this.imageUrl,
  });
}

class User {
  final String id;
  final String email;
  final String displayName;
  final String photoUrl;

  User({
    required this.id,
    required this.email,
    required this.displayName,
    required this.photoUrl,
  });
}