import 'package:greenwave_app/modules/auth/domain/entities/user.dart';

class UserAuthenticaded implements User {
  @override
  int id;
  @override
  String nome;
  @override
  String email;

  String token;

  UserAuthenticaded({this.token, this.id, this.nome, this.email});

  UserAuthenticaded.fromJson(Map<String, dynamic> json)
      : token = json['token'] as String ?? '',
        id = json['id'] as int ?? '',
        nome = json['nome'] as String ?? '',
        email = json['email'] as String ?? '';

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['email'] = this.email;
    return data;
  }
}
