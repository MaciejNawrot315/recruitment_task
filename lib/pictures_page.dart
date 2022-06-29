import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:recruitment_task/constants.dart';
import 'package:recruitment_task/picture.dart';
import 'package:recruitment_task/picture_tile.dart';
import 'package:http/http.dart' as http;

class PicturesPage extends StatefulWidget {
  PicturesPage({super.key});
  Future<List<Picture>> fetchPictures() async {
    const JsonDecoder decoder = JsonDecoder();
    final queryParameters = {
      // 'query': "capybara",
      'count': picturesToDisplay.toString()
    };
    var url = Uri.https(baseUrl, '$photosEndpoint/random', queryParameters);
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

  late final Future<List<Picture>> _pictures = fetchPictures();
  @override
  State<PicturesPage> createState() => _PicturesPageState();
}

class _PicturesPageState extends State<PicturesPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: appBackgroundColor,
      child: FutureBuilder<List<Picture>>(
          future: widget._pictures,
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                  itemBuilder: ((context, index) {
                    return PictureTile(picture: snapshot.data![index]);
                  }),
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 15,
                    );
                  },
                  itemCount: picturesToDisplay);
            } else if (snapshot.hasError) {
              return Center(
                child: Column(
                  children: [
                    const Icon(Icons.error_outline, color: Colors.red),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text('Error: ${snapshot.error}'),
                    ),
                  ],
                ),
              );
            }
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(),
                  Text(
                    "Pictures are loading...",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            );
          })),
    );
  }
}
