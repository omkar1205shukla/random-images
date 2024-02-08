import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:random_image/models/dog_response_model.dart';

class RepositoryImpl {
  Future<DogResponseModel> getRandomImage() async {
    final response =
        await http.get(Uri.parse('https://dog.ceo/api/breeds/image/random'));
    if (response.statusCode == 200) {
      return DogResponseModel.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to load image');
    }
  }
}
