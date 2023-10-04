// Mocks generated by Mockito 5.4.2 from annotations
// in lennar_app/test/setup_services.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:lennar_app/models/image_model.dart' as _i5;
import 'package:lennar_app/services/auth_service.dart' as _i2;
import 'package:lennar_app/services/images_data_source_service.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [AuthService].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthService extends _i1.Mock implements _i2.AuthService {
  MockAuthService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  bool get isUserLoggedIn => (super.noSuchMethod(
        Invocation.getter(#isUserLoggedIn),
        returnValue: false,
      ) as bool);

  @override
  set isUserLoggedIn(bool? value) => super.noSuchMethod(
        Invocation.setter(
          #isUserLoggedIn,
          value,
        ),
        returnValueForMissingStub: null,
      );

  @override
  bool userAuth({
    required String? username,
    required String? password,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #userAuth,
          [],
          {
            #username: username,
            #password: password,
          },
        ),
        returnValue: false,
      ) as bool);

  @override
  void logout() => super.noSuchMethod(
        Invocation.method(
          #logout,
          [],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [ImagesDataSourceService].
///
/// See the documentation for Mockito's code generation for more information.
class MockImagesDataSourceService extends _i1.Mock
    implements _i3.ImagesDataSourceService {
  MockImagesDataSourceService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<List<_i5.ImageModel>> fetchData({
    int? page = 1,
    int? limit = 10,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchData,
          [],
          {
            #page: page,
            #limit: limit,
          },
        ),
        returnValue: _i4.Future<List<_i5.ImageModel>>.value(<_i5.ImageModel>[]),
      ) as _i4.Future<List<_i5.ImageModel>>);
}
