class AuthedUser {
  String username;
  String jwt;
  String cart_id;

  AuthedUser({this.username, this.jwt});

  Map<String, dynamic> get toMap =>
      {'user': username, 'jwt': jwt, 'cart_id': cart_id};

  Function() get empty => () {
        this.username = null;
        this.jwt = null;
        this.cart_id = null;
      };

  Function get formMap => (Map map) {
        this.username = map['user'];
        this.jwt = map['jwt'];
        this.cart_id = map['cart_id'];
      };
}
