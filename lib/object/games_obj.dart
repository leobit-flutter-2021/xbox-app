class GameContent {
  String title;
  String description;
  String icon;

  GameContent(
      {this.title = 'Need for Speed Payback',
      this.description = 'Jump back in',
      this.icon = 'assets/images/img_1.png'});
}

final games = [
  GameContent(
      title: "Need for Speed Payback",
      description: "Jump back in",
      icon: "assets/images/img_1.png"),
  GameContent(
      title: "Minecraft",
      description: "Explore the wonderful world of adventures",
      icon: 'assets/images/img.png'),
  GameContent(
      title: "Fallout 76",
      description: "War... War never changes... ",
      icon: 'assets/images/img_5.png'),
  GameContent(
      title: "Мор",
      description:
          'Everyone says: "Impossible, impossible, impossible ..." What if it works out?',
      icon: 'assets/images/img_6.png')
];
