
class LoginResponseEntity {
  String? message;
  LoginUserEntity? user;
  String? token;

  LoginResponseEntity({this.message, this.user, this.token});

}

class LoginUserEntity {
  String? name;
  String? email;


  LoginUserEntity({this.name, this.email});

  

}