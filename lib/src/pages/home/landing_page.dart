import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stadia_app/src/models/last_played_game.dart';
import 'package:stadia_app/src/pages/styles/colors.dart';
import 'package:stadia_app/src/pages/styles/text_styles.dart';
import 'package:stadia_app/src/pages/utils/images_path.dart';
import 'package:stadia_app/src/pages/widgets/list_item_played_game.dart';
import 'package:stadia_app/src/pages/widgets/online_friends.dart';
import 'package:stadia_app/src/pages/widgets/rounded_image.dart';

class LandingPage extends StatelessWidget {
  var _screenSize;
  var _screenWidth;
  var _screenHeight;

  @override
  Widget build(BuildContext context) {
    _screenSize = MediaQuery.of(context).size;
    _screenWidth = _screenSize.width;
    _screenHeight = _screenSize.height;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          _logo(),
          _body(),
        ],
      ),
      resizeToAvoidBottomInset: false,
    );
  }

  Widget _logo() {
    final logoHeight = _screenHeight * 0.25;

    return Positioned(
      top: 0,
      child: Transform.translate(
        offset: Offset(_screenWidth * 0.7, 0),
        child: SvgPicture.asset(
          logo,
          height: logoHeight,
          color: logoTintColor,
        ),
      ),
    );
  }

  Widget _body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 45.0),
        _toolbar(),
        SizedBox(height: 15.0),
        _userData(),
        _playedHours(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
          child: Text('Last Played Games', style: headingOneTextStyle),
        ),
        Expanded(
          child: _listLastPlayedGames(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
          child: Text('Friends', style: headingOneTextStyle),
        ),
        Container(
          height: 110.0,
          padding: const EdgeInsets.only(left: 10.0),
          alignment: Alignment.center,
          child: OnlineFriends(),
        ),
      ],
    );
  }

  Widget _toolbar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(Icons.menu, color: primaryTextColor),
          Icon(Icons.search, color: primaryTextColor)
        ],
      ),
    );
  }

  Widget _userData() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          RoundedImage(
            imagePath: player1,
            isOnline: true,
            ranking: 39,
            showRanking: true,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: RichText(
              text: TextSpan(children: [
                TextSpan(text: 'Hello', style: userNameTextStyle),
                TextSpan(text: '\n'),
                TextSpan(text: 'Jon Snow', style: userNameTextStyle),
              ]),
            ),
          )
        ],
      ),
    );
  }

  Widget _playedHours() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 20.0, right: 30.0),
      child: Material(
        elevation: 4.0,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.only(
              left: 16.0, right: 16.0, top: 16.0, bottom: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("HOURS PLAYED", style: hoursPlayedLabelTextStyle),
              SizedBox(height: 4.0),
              Text('297 Hours', style: hoursPlayedTextStyle),
            ],
          ),
        ),
      ),
    );
  }

  Widget _listLastPlayedGames() {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
      itemCount: lastPlayedGames.length,
      itemBuilder: (context, index) {
        final item = lastPlayedGames[index];
        return ListItemPlayedGame(item);
      },
    );
  }
}
