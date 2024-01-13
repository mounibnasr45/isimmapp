
import 'package:flutter/material.dart';

import 'newsmodel.dart';


class NewsCard extends StatelessWidget {
  final NMessage nMessage;
  const NewsCard(this.nMessage, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  scrollable: true,
                  title: Text(
                    "${nMessage.sender!.lastName!} ${nMessage.sender!.name!}",
                    style: const TextStyle(color:  Color(0xFF007AFF)),
                  ),
                  content: Column(
                    children: [
                      Text(
                        nMessage.object!,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(nMessage.message!),
                      GestureDetector(
                        child: Text(nMessage.fileUrl!,
                            style: const TextStyle(
                                decoration: TextDecoration.underline,
                                color:  Color(0xFF007AFF),)),
                        onTap: () async {
                          var file = nMessage.fileUrl!;
                          // if (!await launchUrl(
                          //   Uri.parse(
                          //       'https://schoolsystemmanagement-production-9724.up.railway.app/news/files/$file'),
                          //   mode: LaunchMode.externalApplication,
                          // )) {
                          //   throw 'Could not launch $file';
                          // }
                        },
                      )
                    ],
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        //color: primaryColor,
                        child: const Text('Quit',
                            style: TextStyle(color: Colors.white)))
                  ],
                ));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        height: 65,
        width: 153,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(nMessage.object!,
                style: TextStyle(
                    color: Colors.black.withOpacity(0.7),
                    fontSize: 13,
                    fontWeight: FontWeight.w700)),
          ],
        ),
      ),
    );
  }
}
