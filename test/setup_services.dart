import 'package:lennar_app/services/auth_service.dart';
import 'package:lennar_app/services/images_data_source_service.dart';
import 'package:lennar_app/services/locator.dart';
import 'package:mockito/annotations.dart';

import 'setup_services.mocks.dart';

@GenerateMocks(
  [
    AuthService,
    ImagesDataSourceService,
  ],
)
MockAuthService getAndRegisterAuthServiceMock() {
  if (locator.isRegistered<AuthService>()) {
    return locator<AuthService>() as MockAuthService;
  }

  final mock = MockAuthService();
  locator.registerSingleton<AuthService>(mock);

  return mock;
}

MockImagesDataSourceService getAndRegisterImagesDataSourceServiceMock() {
  if (locator.isRegistered<ImagesDataSourceService>()) {
    return locator<ImagesDataSourceService>() as MockImagesDataSourceService;
  }

  final mock = MockImagesDataSourceService();
  locator.registerSingleton<ImagesDataSourceService>(mock);

  return mock;
}
