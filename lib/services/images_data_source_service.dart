import 'package:dio/dio.dart';
import 'package:lennar_app/models/image_model.dart';

class ImagesDataSourceService {
  final Dio _dio = Dio();

  Future<List<ImageModel>> fetchData({int page = 1, int limit = 10}) async {
    try {
      final response = await _dio.get(
        'https://picsum.photos/v2/list',
        queryParameters: {
          'page': page,
          'limit': limit,
        },
      );

      final responseData = response.data;

      if (responseData is List) {
        final List<ImageModel> images = responseData.map((json) => ImageModel.fromJson(json)).toList();
        return images;
      } else {
        throw DioException(
          requestOptions: RequestOptions(path: ''),
          error: 'Unexpected response format',
        );
      }
    } catch (error) {
      throw DioException(
        requestOptions: RequestOptions(path: ''),
        error: 'Error: $error',
      );
    }
  }
}
