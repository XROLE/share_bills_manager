import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_bills_manager/features/Authentication/data/models/user_model.dart';
import 'package:shared_bills_manager/features/Authentication/domain/entities/user.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tUserModdl = UserModel(
      uid: '5b296a7e-36eb-11ec-8d3d-0242ac130003',
      displayName: 'Mr Test',
      email: 'abc@gmail.com',
      emailVerified: false);

  test('Should be a subclass of UserEntitiy', () {
    expect(tUserModdl, isA<UserEntity>());
  });

  group("fromJson", () {
    test("Should return a valid model when the JSON is valid", () {
      final Map<String, dynamic> jsonMap = json.decode(fixture('user_fixture.json'));

      final result = UserModel.fromJson(jsonMap);
      expect(result, tUserModdl);
    });
  });
  group("toJson", () {
    test("Should return a valid JSON Map", () {
      final expectedMap = {
        "uid": "5b296a7e-36eb-11ec-8d3d-0242ac130003",
        "displayName": "Mr Test",
        "email": "abc@gmail.com",
        "emailVerified": false
      };
      final result = tUserModdl.toJson();
      expect(result, expectedMap);
    });
  });
}
