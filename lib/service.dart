import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<Map<String, dynamic>>> fetchDataFromAPI() async {
  final response = await http.get(Uri.parse('YOUR_API_ENDPOINT'));

  if (response.statusCode == 200) {
    final List<dynamic> responseData = json.decode(response.body);
    return responseData
        .map((item) => {
              'image': item['image_url'],
              'title': item['title'],
              'description': item['description'],
            })
        .toList();
  } else {
    throw Exception('Failed to load data');
  }
}
