part of 'screens.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.primaryBlue,
      body: ZStack([
        DelayedDisplay(
            delay: Duration(milliseconds: 60),
            slidingBeginOffset: Offset(-6, 0),
            slidingCurve: Curves.fastOutSlowIn,
            child: Image.asset('assets/rectangle.png')),
        VStack([
          DelayedDisplay(
              delay: Duration(milliseconds: 60),
              slidingBeginOffset: Offset(0, -6),
              slidingCurve: Curves.fastOutSlowIn,
              child: Image.asset('assets/illustration.png')
                  .pOnly(top: 54)
                  .centered()),
          40.heightBox,
          DelayedDisplay(
              delay: Duration(milliseconds: 60),
              slidingBeginOffset: Offset(0, 10),
              slidingCurve: Curves.fastOutSlowIn,
              child: 'Start your journey and make your life happy'
                  .text
                  .textStyle(tStyle.headline6)
                  .center
                  .make()
                  .px64())
        ]).scrollVertical(),
        DelayedDisplay(
            delay: Duration(milliseconds: 60),
            slidingBeginOffset: Offset(0, 10),
            slidingCurve: Curves.fastOutSlowIn,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 0.0,
                  primary: colors.accentPink,
                  shadowColor: colors.accentPink,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100))),
              onPressed: () {
                Get.toNamed('/home');
              },
              child: 'Get Started'
                  .text
                  .textStyle(tStyle.button)
                  .make()
                  .pSymmetric(h: 24, v: 16),
            ).objectBottomCenter().pOnly(bottom: 80))
      ]),
    );
  }
}
