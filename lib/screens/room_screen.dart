import 'dart:math';
import 'package:clubhouse_ui/data.dart';
import 'package:clubhouse_ui/models/room.dart';
import 'package:clubhouse_ui/widgets/room_user_profile.dart';
import 'package:clubhouse_ui/widgets/user_profile_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoomScreen extends StatelessWidget {
  final Room room;
  const RoomScreen({Key? key, required this.room}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 130,
        leading: TextButton.icon(
          onPressed: () => Navigator.of(context).pop(),
          label: const Text('Hallway'),
          style: TextButton.styleFrom(primary: Colors.black),
          icon: const Icon(
            CupertinoIcons.chevron_down,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.doc,
              size: 28,
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: UserProfile(
                size: 30,
                imageUrl: currentUser.imageURL,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(40)),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${room.club} 🏠'.toUpperCase(),
                        style: Theme.of(context).textTheme.overline!.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0),
                      ),
                      const Icon(CupertinoIcons.ellipsis)
                    ],
                  ),
                  Text(
                    room.name,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0),
                  ),
                ],
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(14),
              sliver: SliverGrid.count(
                  crossAxisCount: 3,
                  mainAxisSpacing: 15,
                  children: room.speakers
                      .map((e) => RoomUserProfile(
                            imageURL: e.imageURL,
                            name: e.firstName,
                            size: 66,
                            isNew: Random().nextBool(),
                            isMuted: Random().nextBool(),
                          ))
                      .toList()),
            ),
            SliverToBoxAdapter(
              child: Text(
                'Followed By Speakers',
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[500]),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(14),
              sliver: SliverGrid.count(
                  childAspectRatio: 0.7,
                  crossAxisCount: 4,
                  mainAxisSpacing: 20,
                  children: room.followedBySpeakers
                      .map((e) => RoomUserProfile(
                            imageURL: e.imageURL,
                            name: e.firstName,
                            size: 66,
                            isNew: Random().nextBool(),
                          ))
                      .toList()),
            ),
            SliverToBoxAdapter(
              child: Text(
                'Others',
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[500]),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(14),
              sliver: SliverGrid.count(
                  childAspectRatio: 0.7,
                  crossAxisCount: 4,
                  mainAxisSpacing: 20,
                  children: room.others
                      .map((e) => RoomUserProfile(
                            imageURL: e.imageURL,
                            name: e.firstName,
                            size: 66,
                            isNew: Random().nextBool(),
                          ))
                      .toList()),
            ),
            const SliverPadding(padding: EdgeInsets.only(bottom: 50))
          ],
        ),
      ),
      bottomSheet: Container(
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(12),
                  backgroundColor: Colors.grey[300],
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
              child: const Text(
                '✌️ Leave quietly',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              )),
          Row(
            children: [
              GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[300],
                  ),
                  padding: const EdgeInsets.all(6),
                  child: const Icon(
                    CupertinoIcons.add,
                    size: 30,
                  ),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[300],
                  ),
                  padding: const EdgeInsets.all(8),
                  child: const Icon(
                    CupertinoIcons.hand_raised,
                    size: 30,
                  ),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
