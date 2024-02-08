import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  fetchAndStoreImages();
}

Future<void> fetchAndStoreImages() async {
  final dio = Dio();
  final directory = await getApplicationDocumentsDirectory();
  final images = ['https://dog.ceo/api/breeds/image/random'];

  for (var imageUrl in images) {
    try {
      final response = await dio.get(imageUrl,
          options: Options(responseType: ResponseType.bytes));
      final filePath =
          '${directory.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';
      await File(filePath).writeAsBytes(response.data as List<int>);
      print('Image saved at: $filePath');
    } catch (e) {
      print('Error fetching or saving image: $e');
    }
  }
}
