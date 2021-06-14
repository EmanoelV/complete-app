import '../entity/entity.dart';

abstract class Authentication {
  Future<Account> auth(String email,String password);
}