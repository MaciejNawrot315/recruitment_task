import 'package:flutter/material.dart';
import 'package:recruitment_task/constants.dart';

class LangRow extends StatelessWidget {
  const LangRow(
      {Key? key,
      required this.iconName,
      required this.title,
      required this.level})
      : super(key: key);
  final String iconName;
  final String title;
  final int level;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            iconName,
            width: 30,
            height: 30,
          ),
          SizedBox(
            width: 60,
            child: Text(
              title,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          Icon(
            Icons.circle,
            color: level >= 1 ? myGreen : Colors.grey,
            size: 12,
          ),
          Icon(
            Icons.circle,
            color: level >= 2 ? myGreen : Colors.grey,
            size: 12,
          ),
          Icon(
            Icons.circle,
            color: level >= 3 ? myGreen : Colors.grey,
            size: 12,
          ),
          Icon(
            Icons.circle,
            color: level >= 4 ? myGreen : Colors.grey,
            size: 12,
          ),
          Icon(
            Icons.circle,
            color: level >= 5 ? myGreen : Colors.grey,
            size: 12,
          ),
          const VerticalDivider(
            width: 2,
          ),
        ],
      ),
    );
  }
}
