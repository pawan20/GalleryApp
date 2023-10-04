import 'package:get_it/get_it.dart';
import 'package:lennar_app/services/auth_service.dart';
import 'package:lennar_app/services/images_data_source_service.dart';

GetIt locator = GetIt.I;

Future<void> setupLocator() async {
  GetIt.I.registerLazySingleton(
    () => ImagesDataSourceService(),
  );

  GetIt.I.registerLazySingleton(
    () => AuthService(),
  );

  return GetIt.I.allReady();
}
