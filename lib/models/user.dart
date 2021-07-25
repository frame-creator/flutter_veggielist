//name, email, password, image, token, id, userId

class User {
  User({
    this.name,
    this.email,
    this.image,
    this.id,
  });

  String name;
  String email;
  String image;
  String id;

  factory User.fromJson(Map<String, dynamic> json) => User(
      name: json["name"],
      email: json["email"],
      image: json["image"],
      id: json["id"]);
}
