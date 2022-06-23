import 'package:flutter/material.dart';
import 'package:recruitment_task/api_service.dart';

class AboutMePage extends StatefulWidget {
  const AboutMePage({super.key});
  @override
  State<AboutMePage> createState() => _AboutMePageState();
}

class _AboutMePageState extends State<AboutMePage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: const Text('I love fries'),
          trailing: Icon(Icons.arrow_drop_down),
        ),
        ListTile(
          title: const Text('I love fries'),
          trailing: Icon(Icons.arrow_drop_down),
        ),
        ListTile(
          title: const Text('I love fries'),
          trailing: Icon(Icons.arrow_drop_down),
        )
      ],
    );
  }
}
