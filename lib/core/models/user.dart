class User {
  int id;
  String username;
  String name;
  User({this.id, this.username, this.name});

  User.initial()
      : id = 0,
        username = '',
        name = '';

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['name'] = this.name;
    return data;
  }
}
