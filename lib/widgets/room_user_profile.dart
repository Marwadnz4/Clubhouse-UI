import 'package:clubhouse_ui/widgets/user_profile_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoomUserProfile extends StatelessWidget {
  final String imageURL;
  final String name;
  final double size;
  final bool isNew;
  final bool isMuted;

  const RoomUserProfile({
    Key? key,
    required this.imageURL,
    required this.name,
    this.size = 42,
    this.isNew = false,
    this.isMuted = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(6),
            child: UserProfile(imageUrl: imageURL, size: size),
          ),
          if (isNew)
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 2),
                          blurRadius: 4)
                    ]),
                child: const Text(
                  '🎉',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          if (isMuted)
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 2),
                            blurRadius: 4)
                      ]),
                  child: const Icon(
                    CupertinoIcons.mic_slash_fill,
                  )),
            )
        ],
      ),
      Flexible(
        child: Text(
          name,
          overflow: TextOverflow.ellipsis,
        ),
      )
    ]);
  }
}
