import 'package:clubhouse_ui/data.dart';
import 'package:clubhouse_ui/widgets/user_profile_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:clubhouse_ui/widgets/room_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: 28,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.envelope_open,
                size: 24,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.calendar,
                size: 28,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.bell,
                size: 28,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: UserProfile(
                  size: 34,
                  imageUrl: currentUser.imageURL,
                ),
              ),
            ),
          ],
        ),
        body: Stack(
          alignment: Alignment.center,
          children: [
            ListView(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 100),
              children: [...roomList.map((oneRoom) => RoomCard(room: oneRoom))],
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Theme.of(context)
                            .scaffoldBackgroundColor
                            .withOpacity(0.1),
                        Theme.of(context).scaffoldBackgroundColor,
                      ]),
                ),
              ),
            ),
            Positioned(
              bottom: 50,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.add,
                  size: 21,
                ),
                label: const Text(
                  'Start Room',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(12),
                    primary: Theme.of(context).colorScheme.secondary,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
              ),
            )
          ],
        ));
  }
}
