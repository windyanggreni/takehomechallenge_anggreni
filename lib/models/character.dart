class Character {
  final int id;
  final String name;
  final String species;
  final String gender;
  final Origin origin;
  final Location location;
  final String image;

  Character({
    required this.id,
    required this.name,
    required this.species,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'],
      name: json['name'],
      species: json['species'],
      gender: json['gender'],
      origin: Origin.fromJson(json['origin']),
      location: Location.fromJson(json['location']),
      image: json['image'],
    );
  }
}

class Origin {
  final String name;

  Origin({required this.name});

  factory Origin.fromJson(Map<String, dynamic> json) {
    return Origin(
      name: json['name'],
    );
  }
}

class Location {
  final String name;

  Location({required this.name});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      name: json['name'],
    );
  }
}
