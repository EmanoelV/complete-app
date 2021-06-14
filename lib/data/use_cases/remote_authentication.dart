import 'package:completeapp/domain/use_case/use_case.dart';

import '../http/http.dart';

class RemoteAuthentication {
  final HttpClient httpClient;
  final String url;
  
  RemoteAuthentication(this.httpClient, this.url);
  
  Future<void> auth(AuthenticationParams params) async {
    final body = {'email': params.email, "password": params.passwords};
    await httpClient.request(url, "post", body: body);
  }
}