import 'package:stadia_app/src/pages/utils/images_path.dart';

class LastPlayedGame {
  final String name;
  final int hoursPlayed;
  final String imagePath;
  final double gameProgress;

  LastPlayedGame(
      {this.name, this.hoursPlayed, this.imagePath, this.gameProgress});
}

final lastPlayedGames = [
  LastPlayedGame(
      name: "Assassin's Creed Odyssey",
      hoursPlayed: 10,
      gameProgress: 0.20,
      imagePath: game_assassin),
  LastPlayedGame(
      name: "Dead Cells",
      hoursPlayed: 50,
      gameProgress: 0.80,
      imagePath: game_dead_cells),
  LastPlayedGame(
      name: "Stardew Valley",
      hoursPlayed: 90,
      gameProgress: 0.95,
      imagePath: game_stardew),
  LastPlayedGame(
      name: "Sekiro",
      hoursPlayed: 15,
      gameProgress: 0.45,
      imagePath: game_sekiro),
  LastPlayedGame(
      name: "No Man's Sky",
      hoursPlayed: 3,
      gameProgress: 0.10,
      imagePath: game_no_mans_sky),
  LastPlayedGame(
      name: "Fornite",
      hoursPlayed: 100,
      gameProgress: 0.50,
      imagePath: game_fortnite),
  LastPlayedGame(
      name: "PUBG", hoursPlayed: 180, gameProgress: 0.70, imagePath: game_pubg),
];
