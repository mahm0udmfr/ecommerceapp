class RegisterResponseEntity {
  String? message;
  UserEntity? user;
  String? statusMsg;
  String? token;

  RegisterResponseEntity({this.message, this.user, this.token, this.statusMsg});
}

class UserEntity {
  String? name;
  String? email;

  UserEntity({this.name, this.email});
}
