import 'package:ecommerceapp/domain/entities/register_response_entity.dart';

class RegisterResponseDm extends RegisterResponseEntity {
  RegisterResponseDm({super.message, super.user, super.token, super.statusMsg});

  RegisterResponseDm.fromJson(Map<String, dynamic> json) {
    message = json["message"];

    user =  json['user'] != null ? UserDM.fromJson(json['user']) : null;

    token = json["token"];

    statusMsg = json["statusMsg"];
  }
}

class UserDM extends UserEntity {
  String? role;

  UserDM({super.name, super.email, this.role});

  UserDM.fromJson(Map<String, dynamic> json) {
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["email"] is String) {
      email = json["email"];
    }
    if (json["role"] is String) {
      role = json["role"];
    }
  }
}
