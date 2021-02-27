part of 'models.dart';

class ActivityModel {
  final String title;
  final String subtitle;
  final String asset;
  final double progress;
  final Color color;

  ActivityModel(
      {this.title, this.subtitle, this.asset, this.progress, this.color});
}

List<ActivityModel> listActivity = [
  ActivityModel(
      asset: 'assets/android.png',
      progress: .75,
      title: 'Content Provider',
      subtitle: 'Android',
      color: colors.semanticGreen),
  ActivityModel(
      asset: 'assets/javascript.png',
      progress: .4,
      title: 'Javascript Fundamental',
      subtitle: 'Website',
      color: colors.semanticPink)
];
