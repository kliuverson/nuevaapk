class UserResponse {
  final List<User> users;

  UserResponse({required this.users});

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    final results = json['results'] as List;
    final users = results.map((userJson) => User.fromJson(userJson)).toList();
    return UserResponse(users: users);
  }
}

class User {
  final String name;
  final String email;
  final String imageUrl;

  User({
    required this.name,
    required this.email,
    required this.imageUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    final nameData = json['name'];
    final fullName =
        '${nameData['title']} ${nameData['first']} ${nameData['last']}';
    final email = json['email'];
    final image = json['picture']['large'];
    return User(
      name: fullName,
      email: email,
      imageUrl: image,
    );
  }
}
