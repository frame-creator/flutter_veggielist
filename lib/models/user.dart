//name, email, password, image, token, id, userId

class User {
  User({
    this.name,
    this.email,
    this.password,
    this.image,
    this.token,
    this.userId,
  });

  String name;
  String email;
  String password;
  String image;
  String token;
  String userId;

  factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json["_id"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        image: json["image"],
        token: json["token"],
      );
}
