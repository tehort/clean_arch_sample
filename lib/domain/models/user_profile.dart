class UserProfile {
  UserProfile({
    required this.name,
    required this.avatarUrl,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      name: json['name'],
      avatarUrl: json['avatarUrl'],
    );
  }

  final String name;
  final String avatarUrl;

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'avatarUrl': avatarUrl,
    };
  }
}
