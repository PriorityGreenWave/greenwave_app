class User {
  int id;
  String nome;
  String email;

  User({
    this.id,
    this.nome,
    this.email,
  });

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int ?? '',
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
