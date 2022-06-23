import 'dart:convert';
import 'package:http/http.dart';
import 'package:recruitment_task/constants.dart';
import 'package:http/http.dart' as http;
import 'package:recruitment_task/picture.dart';

Future<List<Picture>> fetchPictures() async {
  const JsonDecoder decoder = JsonDecoder();
  final queryParameters = {
    // 'query': "capybara",
    'count': picturesToDisplay.toString()
  };
  var url = Uri.https(baseUrl, photosEndpoint + '/random', queryParameters);
  var response = await http.get(url, headers: {
    'Accept-Version': 'v1',
    'Authorization': 'Client-ID NPVcu7PntHBText7CYd86FSnBkcvwrqxwueK19f8X1Q'
  });
  final List<dynamic> pictureMapList = decoder.convert(response.body);
  List<Picture> pictureList = [];
  for (Map i in pictureMapList) {
    pictureList.add(Picture.fromJson(i as Map<String, dynamic>));
  }

  return pictureList;
}
