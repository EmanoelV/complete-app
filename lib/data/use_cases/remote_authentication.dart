import 'package:completeapp/domain/use_case/use_case.dart';

import '../http/http.dart';

class RemoteAuthentication {
  final HttpClient httpClient;
  final String url;
  
  RemoteAuthentication(this.httpClient, this.url);
  
  Future<void> auth(AuthenticationParams params) async {
    final body = RemoteAuthenticationParams.fromDomain(params).toJson();
    await httpClient.request(url, "post", body: body);
  }
}
class RemoteAuthenticationParams {
  final String email;
  final String password;

  RemoteAuthenticationParams(this.email, this.password);

  factory RemoteAuthenticationParams.fromDomain(AuthenticationParams params) => 
    RemoteAuthenticationParams(params.email, params.password);

  Map toJson() => {
    "email": email, "password": password
  };
}