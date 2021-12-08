import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiTest extends Mock implements http.Client {}

main() {
  final client = ApiTest();

  group("Request search user with query dmarrugoa", () {
    test("should request complete", () async {
      when(
        client.get(Uri(
            scheme:
                "https://artshackstorageservice.web.app/search/users?q=dmarrugoa")),
      ).thenAnswer(
        (_) async => http.Response(parseUsers([]).toString(), 200),
      );

      expect(await searchUser("dmarrugoa"), isA<List<User>>());
    });

    test("should request failed", () async {
      when(
        client.get(Uri(
            scheme:
                "https://artshackstorageservice.web.app/search/users?q=dmarrugoa")),
      ).thenAnswer(
        (_) async => http.Response(parseUsers([]).toString(), 404),
      );

      expect(await searchUser("dmarrugoa"), isA<List<User>>());
    });
  });

  group("Request detail user", () {
    test("should request complete", () async {
      when(
        client.get(Uri(
            scheme: "https://artshackstorageservice.web.app/users/dmarrugoa")),
      ).thenAnswer(
        (_) async => http.Response(parseUsers([]).toString(), 200),
      );

      expect(await searchUser("dmarrugoa"), isA<List<User>>());
    });

    test("should request failed", () async {
      when(
        client.get(Uri(
            scheme: "https://artshackstorageservice.web.app/users/dmarrugoa")),
      ).thenAnswer(
        (_) async => http.Response(parseUsers([]).toString(), 404),
      );

      expect(await searchUser("dmarrugoa"), isA<List<User>>());
    });
  });
}

List<User> parseUsers(dynamic json) {
  var list = json["items"] as List;
  return list.map((item) => User.generateJson(item)).toList();
}

dynamic generateResponse(http.Response response) {
  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    return "";
  }
}

Future<List<User>> searchUser(String username) async {
  return await http
      .get(Uri(
          scheme:
              'https://artshackstorageservice.web.app/search/users?q=$username'))
      .then((response) => generateResponse(response))
      .then((data) => parseUsers(data));
}

Future<User> getDetailUser(String urlUsername) async {
  return await http
      .get(Uri(scheme: urlUsername))
      .then((response) => generateResponse(response))
      .then((data) => User.generateJson(data));
}

class User {
  final int id;
  final String email;
  final String displayName;
  final String photoUrl;
  final String createdTime;
  final String phoneNumber;
  final String userRole;
  final String password;

  User(
      {this.id,
      this.email,
      this.displayName,
      this.photoUrl,
      this.createdTime,
      this.phoneNumber,
      this.userRole,
      this.password});

  factory User.generateJson(Map<String, dynamic> json) {
    return User(
        id: json["id"],
        email: json["email"] == null ? "" : json["email"],
        displayName: json["display_name"],
        photoUrl: json["photo_url"],
        createdTime: json["created_time"],
        phoneNumber: json["phone_number"],
        userRole: json["user_role"] == null ? 0 : json["user_role"],
        password: json["password"] == null ? "" : json["password"]);
  }
}
