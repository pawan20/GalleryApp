import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:lennar_app/view_models/login_screen_view_model.dart';

import '../setup_services.dart';
import '../setup_services.mocks.dart';

void main() {
  group('LoginScreenViewModel Tests', () {
    late LoginScreenViewModel viewModel;
    late MockAuthService mockAuthService;

    setUp(() {
      mockAuthService = getAndRegisterAuthServiceMock();
      viewModel = LoginScreenViewModel();
    });

    test('handleLoginCta - Successful login, should return true', () {
      when(
        mockAuthService.userAuth(username: anyNamed('username'), password: anyNamed('password')),
      ).thenReturn(true);

      final result = viewModel.handelLoginCta();

      expect(result, true);
      expect(viewModel.errorMessage, isNull);
      verify(
        mockAuthService.userAuth(username: anyNamed('username'), password: anyNamed('password')),
      ).called(1);
    });

    test('handleLoginCta - Unsuccessful login, should return false', () {
      when(
        mockAuthService.userAuth(username: anyNamed('username'), password: anyNamed('password')),
      ).thenReturn(false);

      final result = viewModel.handelLoginCta();

      expect(result, false);
      expect(viewModel.errorMessage, 'Check Username and Password, Try Again!');
      verify(
        mockAuthService.userAuth(username: anyNamed('username'), password: anyNamed('password')),
      ).called(1);
    });
  });
}
