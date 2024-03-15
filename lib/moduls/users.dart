class users {
  int? id;
  String? username;
  String? password;
  String? firstname;
  String? lastname;
  String? email;
  String? roles;

  users(
      {this.id,
        this.username,
        this.password,
        this.firstname,
        this.lastname,
        this.email,
        this.roles
      });

  users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    password = json['password'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    email = json['email'];
    roles = json['roles'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['password'] = this.password;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['email'] = this.email;
    data['roles'] = this.roles;
    return data;
  }
}