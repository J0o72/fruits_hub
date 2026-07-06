class UserEntity {
  final String userId;
  final String email;
  final String name;

  UserEntity({required this.userId, required this.email, required this.name});

  Map<String, dynamic> toMap() {
    return {'name': name, 'email': email, 'user_id': userId};
  }
}
