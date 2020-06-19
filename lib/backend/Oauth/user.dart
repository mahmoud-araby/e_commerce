class User {
  String username;
  String password;
  String jwt;

  User({this.username, this.password, this.jwt});

  Map<String, dynamic> get toMap => {'user': username, 'jwt': jwt};

  Function() get empty => () {
        username = null;
        jwt = null;
        password = null;
      };

  Function get formMap => (Map map) {
        username = map['user'];
        jwt = map['jwt'];
      };
}
