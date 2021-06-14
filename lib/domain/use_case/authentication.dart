import '../entity/entity.dart';

abstract class Authentication {
  Future<Account> auth(AuthenticationParams params);
}

class AuthenticationParams {
  final String email;
  final String passwords;

  AuthenticationParams(this.email, this.passwords);
}