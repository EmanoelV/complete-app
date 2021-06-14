import 'package:faker/faker.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class RemoteAuthentication {
  final HttpClient httpClient;
  final String url;
  Future<void> auth() async {
    await httpClient.request(url, "post");
  }

  RemoteAuthentication(this.httpClient, this.url);
}

abstract class HttpClient {
  Future<void> ?request(String url, String method) {}
}

class HttpClientSpy extends Mock implements HttpClient {}

void main() {
  test('Corret values', () async {
    final httpClient = HttpClientSpy();
    final url = faker.internet.httpUrl();
    final sut = RemoteAuthentication(httpClient, url);

    await sut.auth();

    verify(httpClient.request(url, "post"));
  });
}