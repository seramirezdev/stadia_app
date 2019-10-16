import 'package:flutter/material.dart';
import 'package:stadia_app/src/models/last_played_game.dart';
import 'package:stadia_app/src/pages/styles/text_styles.dart';
import 'package:stadia_app/src/pages/widgets/game_progress.dart';

class ListItemPlayedGame extends StatelessWidget {
  final LastPlayedGame _lastPlayedGame;

  const ListItemPlayedGame(this._lastPlayedGame, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Row(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        _lastPlayedGame.imagePath,
                        height: 60.0,
                        width: 45.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 0.0,
                      top: 0.0,
                      left: 8.0,
                      right: 8.0,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Icon(Icons.play_arrow, color: Colors.red),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: _lastPlayedGame.name,
                          style: headingTwoTextStyle),
                      TextSpan(text: "\n"),
                      TextSpan(
                        text: '${_lastPlayedGame.hoursPlayed} hours played',
                        style: bodyTextStyle,
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: LayoutBuilder(
            builder: (_, constraint) {
              return GameProgress(_lastPlayedGame, width: constraint.maxWidth);
            },
          ))
        ],
      ),
    );
  }
}
