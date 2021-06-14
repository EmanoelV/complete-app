import 'package:completeapp/domain/use_case/authentication.dart';
import 'package:faker/faker.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class RemoteAuthentication {
  final HttpClient httpClient;
  final String url;
  
  RemoteAuthentication(this.httpClient, this.url);
  
  Future<void> auth(AuthenticationParams params) async {
    final body = {'email': params.email, "password": params.passwords};
    await httpClient.request(url, "post", body: body);
  }
}

abstract class HttpClient {
  Future<void> ?request(String url, String method, {Map? body}) {}
}

class HttpClientSpy extends Mock implements HttpClient {}

void main() {
  final httpClient = HttpClientSpy();
  final url = faker.internet.httpUrl();
  final sut = RemoteAuthentication(httpClient, url);

  test('Correct values', () async {
    final params = AuthenticationParams(faker.internet.email(), faker.internet.password());
    await sut.auth(params);
    verify(httpClient.request(
      url, "post", 
      body: {
        'email': params.email, 
        'password': params.passwords
      }
    ));
  });
}