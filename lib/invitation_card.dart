import 'dart:typed_data';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:screenshot/screenshot.dart';


class InvitationCard extends StatefulWidget {

  late String name;
  late String location;
  late String letter;


  InvitationCard({
    required this.letter,
    required this.location,
    required this.name,
  });

  @override
  State<InvitationCard> createState() => _InvitationCardState();
}

class _InvitationCardState extends State<InvitationCard> {

  final screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.orangeAccent,
        label: const Text(
          'مشاركة الدعوة',
        ),
        icon: const Icon(
          Icons.share,
        ),
        onPressed: () {
           _takeScreenshot();
        },
      ),
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 0,
      ),
      body: Screenshot(
        controller: screenshotController,
        child: Padding(
          padding: const EdgeInsets.only(
            right: 10,
            left: 10,
            bottom: 80,
            top: 30,
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 40.0,
              vertical: 30,
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(120),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(100),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const  Hero(
                  tag: 'dash',
                  child:  Center(
                    child:  CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(
                        'https://events.flutter.dev/engage/assets/img/community-hero.png',
                      ),

                    ),
                  ),
                ),
                const Center(
                  child: Text(
                    'دعوة حضور',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 27.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Text(
                  ' عزيزي/تي ${widget.name}',
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text(
                    '${widget.letter}',
                    maxLines: 2,
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  '.في مدينة ${widget.location}',
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  ',تحياتي',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.0,
                  ),
                  child: const Text(
                    'داش',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  void _takeScreenshot() async {
    await screenshotController.capture(delay: const Duration(milliseconds: 10))
        .then((image) async {
      if (image != null) {
        final directory = await getApplicationDocumentsDirectory();
        final imagePath = await File('${directory.path}/image.png').create();
        final Uint8List pngBytes = image.buffer.asUint8List();
        await imagePath.writeAsBytes(pngBytes);

        /// Share Plugin
        await Share.shareFiles([imagePath.path]);
      }
    });
  }
}