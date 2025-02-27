import 'package:ecommerceapp/domain/entities/login_response_entity.dart';

class LoginResponseDm extends LoginResponseEntity {
  String? statusMsg;
  LoginResponseDm({super.message, super.user, super.token});

  LoginResponseDm.fromJson(Map<String, dynamic> json) {
    message = json["message"];
    user = json['user'] != null ? LoginUserDm.fromJson(json['user']) : null;
    token = json["token"];
    statusMsg = json["statusMsg"];
  }

  static List<LoginResponseDm> fromList(List<Map<String, dynamic>> list) {
    return list.map(LoginResponseDm.fromJson).toList();
  }
}

class LoginUserDm extends LoginUserEntity {
  String? role;

  LoginUserDm({super.name, super.email, this.role});

  LoginUserDm.fromJson(Map<String, dynamic> json) {
    name = json["name"];

    email = json["email"];

    role = json["role"];
  }

  static List<LoginUserDm> fromList(List<Map<String, dynamic>> list) {
    return list.map(LoginUserDm.fromJson).toList();
  }
}
