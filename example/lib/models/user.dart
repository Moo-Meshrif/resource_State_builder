class User {
  final int id;
  final String name;
  final String email;
  final String avatarUrl;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.avatarUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'] ?? '${json['firstName']} ${json['lastName']}',
      email: json['email'],
      avatarUrl: json['avatarUrl'] ??
          json['image'] ??
          'https://i.pravatar.cc/150?u=${json['id']}',
    );
  }

  static User get mock => User(
        id: 1,
        name: 'Jane Doe',
        email: 'jane.doe@example.com',
        avatarUrl: 'https://i.pravatar.cc/150?u=1',
      );
}
