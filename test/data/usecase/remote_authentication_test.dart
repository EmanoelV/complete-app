import 'package:faker/faker.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:completeapp/data/http/http.dart';
import 'package:completeapp/data/use_cases/use_cases.dart';
import 'package:completeapp/domain/use_case/authentication.dart';

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
        'password': params.password
      }
    ));
  });
}