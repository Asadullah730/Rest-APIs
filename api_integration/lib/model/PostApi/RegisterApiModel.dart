class Registerapimodel {
  int? id;
  String? token;

  Registerapimodel({this.id, this.token});

  Registerapimodel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> values = new Map<String, dynamic>();
    values['token'] = this.token;
    values['id'] = this.id;
    return values;
  }
}
