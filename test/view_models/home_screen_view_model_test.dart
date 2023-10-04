import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:lennar_app/models/image_model.dart';
import 'package:lennar_app/view_models/home_screen_view_model.dart';

import '../setup_services.dart';
import '../setup_services.mocks.dart';

void main() {
  group('HomeScreenViewModel Tests', () {
    late HomeScreenViewModel viewModel;
    late MockImagesDataSourceService mockImagesDataService;

    setUp(() {
      mockImagesDataService = getAndRegisterImagesDataSourceServiceMock();
      viewModel = HomeScreenViewModel();
    });

    test('fetchImages - Success', () async {
      when(mockImagesDataService.fetchData(
        page: 1,
        limit: 10,
      )).thenAnswer((_) async => testData);

      await viewModel.fetchImages();

      expect(viewModel.isLoading, false);
      expect(viewModel.errorMessage, isNull);
      expect(viewModel.imageList, testData);
      verify(
        mockImagesDataService.fetchData(page: 1, limit: 10),
      ).called(1);
    });

    test('fetchImages - Failure', () async {
      when(
        mockImagesDataService.fetchData(page: 1, limit: 10),
      ).thenThrow('Some error message');

      await viewModel.fetchImages();

      expect(viewModel.isLoading, false);
      expect(viewModel.errorMessage, 'Some error message');
      expect(viewModel.imageList, isEmpty);
      verify(
        mockImagesDataService.fetchData(page: 1, limit: 10),
      ).called(1);
    });

    test('fetchImages - Success, when loadMoreData() is called', () async {
      when(
        mockImagesDataService.fetchData(page: 2, limit: 20),
      ).thenAnswer((_) async => testData);

      await viewModel.loadMoreData();

      expect(viewModel.isLoading, false);
      expect(viewModel.errorMessage, isNull);
      expect(viewModel.imageList, testData);
      verify(
        mockImagesDataService.fetchData(page: 2, limit: 20),
      ).called(1);
      verifyNoMoreInteractions(mockImagesDataService);
    });

    test('fetchImages - Failure, when loadMoreData() is called', () async {
      when(
        mockImagesDataService.fetchData(page: 2, limit: 20),
      ).thenThrow('Some error message');

      await viewModel.loadMoreData();

      expect(viewModel.isLoading, false);
      expect(viewModel.errorMessage, 'Some error message');
      expect(viewModel.imageList, isEmpty);
      verify(
        mockImagesDataService.fetchData(page: 2, limit: 20),
      ).called(1);
      verifyNoMoreInteractions(mockImagesDataService);
    });
  });
}

final testData = List.generate(
  10,
  (index) => ImageModel(
    id: index.toString(),
    url: 'url$index',
    author: 'authorName',
    downloadUrl: 'http://someimage.com/img$index.jpg',
    height: 200,
    width: 200,
  ),
);
