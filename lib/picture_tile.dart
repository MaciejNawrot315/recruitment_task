import 'package:flutter/material.dart';
import 'package:recruitment_task/constants.dart';
import 'package:recruitment_task/picture.dart';
import './details_page.dart';

class PictureTile extends StatefulWidget {
  final Picture picture;
  const PictureTile({Key? key, required this.picture}) : super(key: key);
  @override
  State<PictureTile> createState() => _PictureTileState();
}

class _PictureTileState extends State<PictureTile> {
  void _goToDetails(Picture picture) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => DetailsPage(picture: widget.picture)),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height > 750
        ? 750
        : MediaQuery.of(context).size.height;
    double imageWidth =
        (widget.picture.width! / widget.picture.height!) * height;
    return LayoutBuilder(
      builder: (context, constraints) => Align(
          alignment: Alignment.center,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(36.0),
            child: MediaQuery.of(context).size.width >
                    smallScreenBoundry //Display
                ? Container(
                    color: tileColor,
                    width: smallScreenBoundry - 72,
                    height: height,
                    child: Row(children: [
                      SizedBox(
                        width: smallScreenBoundry - 242,
                        child: Center(
                          child: SizedBox(
                            width: imageWidth,
                            child: Hero(
                                tag: 'image${widget.picture.id}',
                                child: widget.picture.image!),
                          ),
                        ),
                      ),
                      const VerticalDivider(width: 1),
                      SizedBox(
                        width: smallScreenBoundry - 599,
                        height: height,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 20, 25, 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Center(
                                  child: Text(
                                    "author: ${widget.picture.user!.name}",
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              TextButton.icon(
                                  onPressed: () => _goToDetails(widget.picture),
                                  icon: const Icon(Icons.arrow_forward),
                                  label: const Text("See details")),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 25, 5, 10),
                                child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: IconButton(
                                    icon: const Icon(Icons.favorite_border),
                                    onPressed: () => debugPrint("favourite"),
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
                  )
                : Column(children: [
                    GestureDetector(
                      onTap: () => _goToDetails(widget.picture),
                      child: Hero(
                          tag: 'image${widget.picture.id}',
                          child: widget.picture.image!),
                    ),
                    Flex(
                        direction: Axis.horizontal,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
                            fit: FlexFit.tight,
                            child: Container(
                                height: 50,
                                color: tileColor,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 8, 25, 8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "  author: ${widget.picture.user!.name}",
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.favorite_border),
                                        onPressed: () =>
                                            debugPrint("favourite"),
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                        ])
                  ]),
          )),
    );
  }
}
