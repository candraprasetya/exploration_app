part of 'models.dart';

class QuizModel {
  final String asset;
  final String category;
  final Color color;
  final String title;
  final int player;
  final bool isFav;

  QuizModel(
      {this.asset,
      this.category,
      this.color,
      this.title,
      this.player,
      this.isFav});
}

List<String> listCategory = [
  'All',
  'Website',
  'Mobile',
  'Design',
  'UI/UX',
  'Artificial Inteligence'
];

List<QuizModel> listQuiz = [
  QuizModel(
      asset: 'assets/ux.png',
      category: listCategory[4],
      color: colors.semanticBlue,
      isFav: false,
      player: 12,
      title: 'Design Thinking'),
  QuizModel(
      asset: 'assets/android.png',
      category: listCategory[2],
      color: colors.semanticGreen,
      isFav: true,
      player: 18,
      title: 'Content Provider')
];
