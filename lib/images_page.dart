import 'package:flutter/material.dart';
import 'package:recruitment_task/api_service.dart';
import 'package:recruitment_task/constants.dart';
import 'package:recruitment_task/picture.dart';
import 'package:recruitment_task/picture_tile.dart';

class ImagesPage extends StatefulWidget {
  ImagesPage({super.key});
  Future<List<Picture>> _pictures = fetchPictures();
  @override
  State<ImagesPage> createState() => _ImagesPageState();
}

class _ImagesPageState extends State<ImagesPage> {
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
