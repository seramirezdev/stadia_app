import 'package:flutter/material.dart';
import 'package:stadia_app/src/models/last_played_game.dart';
import 'package:stadia_app/src/pages/styles/colors.dart';

class GameProgress extends StatefulWidget {
  final LastPlayedGame _lastPlayedGame;
  final double width;

  const GameProgress(this._lastPlayedGame, {Key key, this.width})
      : super(key: key);

  @override
  _GameProgressState createState() => _GameProgressState();
}

class _GameProgressState extends State<GameProgress>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animationProgress;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));

    final animationCurve =
        CurvedAnimation(parent: _animationController, curve: Curves.easeOut);

    _animationProgress = Tween<double>(
            begin: 0, end: widget.width * widget._lastPlayedGame.gameProgress)
        .animate(animationCurve);
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _animationController.forward();
    return AnimatedBuilder(
      animation: _animationController,
      builder: (__, _) {
        return Stack(
          children: <Widget>[
            Container(
              width: widget.width,
              height: 10.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                border: Border.all(color: tertiaryTextColor, width: 0.5),
              ),
            ),
            Container(
              width: _animationProgress.value,
              height: 10.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                gradient: appGradient,
              ),
            ),
          ],
        );
      },
    );
  }
}
