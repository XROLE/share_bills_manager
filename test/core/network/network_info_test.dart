import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_bills_manager/core/network/network_info.dart';

class MockInternetConnectionChecker extends Mock implements InternetConnectionChecker {}

void main() {
  late NetworkInfoImpl networkInfoImpl;
  late MockInternetConnectionChecker mockInternetConnectionChecker;
  setUp(() {
    mockInternetConnectionChecker = MockInternetConnectionChecker();
    networkInfoImpl = NetworkInfoImpl(mockInternetConnectionChecker);
  });

  // group('isConnected', () {
  //   test("Should forward the call to InternetConnectionChecker.hasConnection", () async {
  //     final tHasConnectionFuture = Future.value(true);

  //     when(mockInternetConnectionChecker.hasConnection).thenAnswer((_) => tHasConnectionFuture);

  //     final result = networkInfoImpl.isConnected;

  //     verify(mockInternetConnectionChecker.hasConnection);
  //     expect(result, tHasConnectionFuture);
  //   });
  // });
}
