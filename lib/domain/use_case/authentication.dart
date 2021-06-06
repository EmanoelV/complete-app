import 'package:meta/meta.dart';

import '../entity/entity.dart';

abstract class Authentication {
  Future<Account> auth({
    @required String email,
    @required String password
  });
}