import 'package:flutter/material.dart';
import './picture.dart';

class DetailsPage extends StatefulWidget {
  final Picture picture;
  const DetailsPage({Key? key, required this.picture}) : super(key: key);
  @override
  State<DetailsPage> createState() => _DetailsState();
}

class _DetailsState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          ListTile(
            title: const Text('I love my details'),
          )
        ],
      ),
    );
  }
}
