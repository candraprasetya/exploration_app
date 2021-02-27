part of 'models.dart';

class CourseModel {
  final String asset;
  final String category;
  final Color color;
  final String title;
  final int player;
  final bool isFav;

  CourseModel(
      {this.asset,
      this.category,
      this.color,
      this.title,
      this.player,
      this.isFav});
}

List<CourseModel> listCourse = [
  CourseModel(
      asset: 'assets/ai.png',
      category: listCategory[5],
      color: colors.semanticPurple,
      isFav: true,
      player: 20,
      title: 'Neural Network'),
  CourseModel(
      asset: 'assets/ux.png',
      category: listCategory[4],
      color: colors.semanticBlue,
      isFav: false,
      player: 12,
      title: 'Design Thinking'),
  CourseModel(
      asset: 'assets/javascript.png',
      category: listCategory[1],
      color: colors.accentPink,
      isFav: false,
      player: 12,
      title: 'Javascript')
];
