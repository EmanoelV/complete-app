import '../entity/entity.dart';

abstract class Authentication {
  Future<Account> auth(AuthenticationParams params);
}

class AuthenticationParams {
  final String email;
  final String password;

  AuthenticationParams(this.email, this.password);
}