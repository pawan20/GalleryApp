import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lennar_app/views/splash_screen.dart';
import 'package:mockito/mockito.dart';
import 'package:lennar_app/view_models/splash_screen_view_model.dart';
import 'package:provider/provider.dart';

import '../setup_services.dart';
import '../setup_services.mocks.dart';

void main() {
  group('SplashScreenViewModel Tests', () {
    late SplashScreenViewModel viewModel;
    late MockAuthService mockAuthService;

    setUp(() {
      mockAuthService = getAndRegisterAuthServiceMock();
      viewModel = SplashScreenViewModel();
    });

    testWidgets('loadInitialData Success', (WidgetTester tester) async {
      when(mockAuthService.isUserLoggedIn).thenReturn(true);

      expect(viewModel.isLoading, false);
      verifyNoMoreInteractions(mockAuthService);
    });

    testWidgets('loadInitialData Failure', (WidgetTester tester) async {
      when(mockAuthService.isUserLoggedIn).thenReturn(false);

      await tester.pumpWidget(MaterialApp(
        home: ChangeNotifierProvider(
          create: (_) => viewModel,
          child: const SplashScreen(),
        ),
      ));

      await tester.pump(const Duration(seconds: 2));

      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(viewModel.isLoading, false);
      verify(mockAuthService.isUserLoggedIn).called(1);
      verifyNoMoreInteractions(mockAuthService);
    });
  });
}
