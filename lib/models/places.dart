//location":{"lat","lng"},"_id","title","description","address","image","creator","id"

class PlaceList {
  final List<Place> places;

  PlaceList({this.places});

  factory PlaceList.fromJson(List<dynamic> parsedjson) {
    // ignore: deprecated_member_use
    List<Place> places = new List<Place>();
    places = parsedjson.map((i) => Place.fromJson(i)).toList();

    return new PlaceList(places: places);
  }
}

class Place {
  Place({
    this.location,
    this.id,
    this.title,
    this.description,
    this.address,
    this.image,
    this.creator,
    this.placeId,
  });

  Location location;
  String id;
  String title;
  String description;
  String address;
  String image;
  String creator;
  String placeId;

  factory Place.fromJson(Map<String, dynamic> json) => Place(
        location: Location.fromJson(json["location"]),
        id: json["_id"],
        title: json["title"],
        description: json["description"],
        address: json["address"],
        image: json["image"],
        creator: json["creator"],
        placeId: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "location": location.toJson(),
        "_id": id,
        "title": title,
        "description": description,
        "address": address,
        "image": image,
        "creator": creator,
        "id": placeId,
      };
}

class Location {
  Location({
    this.lat,
    this.lng,
  });

  double lat;
  double lng;

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(lat: json['lat'], lng: json['lng']);
  }

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}
