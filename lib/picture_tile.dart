import 'package:flutter/material.dart';
import 'package:recruitment_task/picture.dart';

class PictureTile extends StatefulWidget {
  final Picture picture;
  const PictureTile({Key? key, required this.picture}) : super(key: key);
  @override
  State<PictureTile> createState() => _PictureTileState();
}

class _PictureTileState extends State<PictureTile> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Align(
        child: SizedBox(
          width: constraints.maxWidth > 1080 ? 1080 : constraints.maxWidth,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(36.0),
            child: Column(children: [
              widget.picture.image!,
              Flex(
                  direction: Axis.horizontal,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      child: Container(
                        height: 50,
                        color: Colors.grey[800],
                        child: Text(
                          "Piekne zdjecie",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ])
            ]),
          ),
        ),
      ),
    );
  }
}
