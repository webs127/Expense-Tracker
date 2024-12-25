class UserModel {
  final int? id;
  final String username;
  final String password;
  final String email;
  final String gender;
  final int age;

  UserModel(
      {this.id,
      required this.username,
      required this.age,
      required this.password,
      required this.email,
      required this.gender});

  UserModel copyWith(
          {int? id,
          String? username,
          String? password,
          String? email,
          String? gender,
          int? age}) =>
      UserModel(
          id: id ?? this.id,
          username: username ?? this.username,
          password: password ?? this.password,
          email: email ?? this.email,
          gender: gender ?? this.gender,
          age: age ?? this.age);

  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'password': password,
        'email': email,
        'gender': gender,
        'age': age
      };

  factory UserModel.fromJson(Map<String, dynamic> data) => UserModel(
      id: data['id'],
      username: data['username'],
      password: data['password'],
      email: data['email'],
      gender: data['gender'],
      age: (data['age']));

  @override
  String toString() {
    return """{id: $id,
username: $username,
password: $password,
email: $email,
gender: $gender,
age: $age}
""";
  }
}
