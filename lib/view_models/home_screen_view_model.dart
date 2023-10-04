// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:lennar_app/models/image_model.dart';
import 'package:lennar_app/services/images_data_source_service.dart';
import 'package:lennar_app/services/locator.dart';

class HomeScreenViewModel extends ChangeNotifier {
  final _intialDataService = locator<ImagesDataSourceService>();

  int _currentPage = 1;
  final int _pageSize = 20;

  bool isLoading = false;
  String? errorMessage;

  final List<ImageModel?> _imageList = [];
  List<ImageModel?> get imageList => _imageList;

  Future<void> fetchImages({int page = 1, int limit = 10}) async {
    errorMessage = null;
    isLoading = true;
    try {
      final data = await _intialDataService.fetchData(page: page, limit: limit);

      await Future.delayed(const Duration(seconds: 1));

      _imageList.addAll(data);  

    } catch (error) {
      errorMessage = error.toString();
      print('Error: $error');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadMoreData() async {
    if (isLoading) {
      return;
    }

    try {
      _currentPage++;
      await fetchImages(page: _currentPage, limit: _pageSize);
    } catch (error) {      
      errorMessage = error.toString();
      print('Error: $error');
    }
  }
}
