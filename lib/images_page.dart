import 'package:flutter/material.dart';
import 'package:recruitment_task/api_service.dart';
import 'package:recruitment_task/constants.dart';
import 'package:recruitment_task/picture.dart';
import 'package:recruitment_task/picture_tile.dart';

class ImagesPage extends StatefulWidget {
  const ImagesPage({super.key});
  @override
  State<ImagesPage> createState() => _ImagesPageState();
}

Future<List<Picture>> _pictures = fetchPictures();

class _ImagesPageState extends State<ImagesPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[850],
      child: FutureBuilder<List<Picture>>(
          future: _pictures,
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
                children: const [
                  CircularProgressIndicator(),
                  Text("Pictures are loading...")
                ],
              ),
            );
          })),
    );
  }
}
