import 'package:flutter/material.dart';
import 'package:stadia_app/src/models/friend.dart';
import 'package:stadia_app/src/pages/widgets/rounded_image.dart';

class OnlineFriends extends StatelessWidget {
  const OnlineFriends({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        children: friends.map(_friendWidget).toList());
  }

  Widget _friendWidget(Friend friend) {
    return RoundedImage(
      imagePath: friend.imagePath,
      isOnline: friend.isOnline,
      showRanking: false,
      name: friend.name,
    );
  }
}
