class GameContent {
  String title;
  String description;
  String icon;
  String score;
  String percentAchieve;
  String winnerCup;

  GameContent(
      {this.title = 'Need for Speed Payback',
      this.description = 'Jump back in',
      this.icon = 'assets/images/img_nfs.png',
      this.score = '0/1000',
      this.percentAchieve = "0%",
      this.winnerCup = '0'});
}

final games = [
  GameContent(
      title: "Need for Speed Payback",
      description: "Jump back in",
      icon: "assets/images/img_nfs.png",
      score: '100/1000',
      percentAchieve: "10%",
      winnerCup: '8'),
  GameContent(
      title: "Minecraft",
      description: "Explore the wonderful world of adventures",
      icon: 'assets/images/img_minecraft.png',
      score: '250/500',
      percentAchieve: "50%",
      winnerCup: '26'),
  GameContent(
      title: "Fallout 76",
      description: "War... War never changes... ",
      icon: 'assets/images/img_fallout.png',
      score: '150/500',
      percentAchieve: "30%",
      winnerCup: '111'),
  GameContent(
      title: "Мор",
      description:
          'Everyone says: "Impossible, impossible, impossible ..." What if it works out?',
      icon: 'assets/images/img_mor.png')
];
