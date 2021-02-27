part of '../screens.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedCategory = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.primaryBlue,
      body: SafeArea(
          child: ZStack([
        Positioned(
          top: -200,
          left: -200,
          child: Image.asset('assets/kotak.png'),
        ),
        VStack([
          topBar(),
          listTopItem(),
          body(),
        ]),
      ])),
    );
  }

  Widget topBar() {
    return HStack(
      [
        DelayedDisplay(
          delay: Duration(milliseconds: 40),
          slidingBeginOffset: Offset(-10, 0),
          slidingCurve: Curves.fastOutSlowIn,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/avatar.png',
              scale: 5,
              fit: BoxFit.contain,
            ),
          ),
        ),
        12.widthBox,
        VStack(
          [
            DelayedDisplay(
                delay: Duration(milliseconds: 60),
                slidingBeginOffset: Offset(0, -10),
                slidingCurve: Curves.fastOutSlowIn,
                child: greeting()
                    .text
                    .textStyle(tStyle.general.copyWith(color: colors.textGrey))
                    .make()),
            DelayedDisplay(
                delay: Duration(milliseconds: 80),
                slidingBeginOffset: Offset(0, -10),
                slidingCurve: Curves.fastOutSlowIn,
                child: VxBox(
                        child: 'Candra Ramadhan Prasetya'
                            .text
                            .ellipsis
                            .textStyle(tStyle.subtitle1
                                .copyWith(color: colors.semanticWhite))
                            .xl2
                            .make())
                    .width(context.percentWidth * 52)
                    .make())
          ],
        ),
        Expanded(
          flex: 1,
          child: 0.widthBox,
        ),
        DelayedDisplay(
            delay: Duration(milliseconds: 100),
            slidingBeginOffset: Offset(10, 0),
            slidingCurve: Curves.fastOutSlowIn,
            child: IconButton(
              onPressed: () {},
              color: colors.semanticWhite,
              icon: Icon(Icons.notifications),
            ))
      ],
    ).pLTRB(30, 30, 30, 12);
  }

  Widget bodySubTitle(String title, {Function function}) {
    return title.text
        .textStyle(tStyle.subtitle1)
        .size((function != null) ? 12 : 16)
        .color((function != null) ? colors.primaryBlue : colors.semanticBlack)
        .make()
        .pLTRB(30, 30, 30, 12)
        .onTap(function);
  }

  Widget body() {
    return ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            child: VxBox(
                    child: VStack([
              DelayedDisplay(
                  delay: Duration(milliseconds: 80),
                  child: bodySubTitle('Recent Activity')),
              VStack(listActivity
                      .map((element) => DelayedDisplay(
                          delay: Duration(
                              milliseconds:
                                  100 * (6 * listActivity.indexOf(element))),
                          slidingCurve: Curves.fastOutSlowIn,
                          child: cardRecent(
                              asset: element.asset,
                              color: element.color,
                              progress: element.progress,
                              title: element.title,
                              subtitle: element.subtitle)))
                      .toList())
                  .scrollVertical(),
              serachBar(),
              categoryList(),
              HStack(
                [
                  DelayedDisplay(
                      delay: Duration(milliseconds: 120),
                      child: bodySubTitle('Recommended')),
                  0.widthBox.expand(),
                  DelayedDisplay(
                      delay: Duration(milliseconds: 140),
                      child: bodySubTitle('Show all', function: () {
                        Get.snackbar('Fitur', 'Show all Recommended');
                      })),
                ],
              ),
              courseList(),
              HStack(
                [
                  DelayedDisplay(
                      delay: Duration(milliseconds: 160),
                      child: bodySubTitle('Popular Quiz')),
                  0.widthBox.expand(),
                  DelayedDisplay(
                      delay: Duration(milliseconds: 180),
                      child: bodySubTitle('Show all', function: () {
                        Get.snackbar('Fitur', 'Show all Popular Quiz');
                      })),
                ],
              ),
              quizList(),
            ]).scrollVertical(physics: BouncingScrollPhysics()))
                .white
                .make()
                .wFull(context))
        .expand();
  }

  Widget courseList() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: HStack(listCourse
          .map((e) => DelayedDisplay(
                delay:
                    Duration(milliseconds: 120 + (10 * listCourse.indexOf(e))),
                slidingCurve: Curves.fastOutSlowIn,
                child: courseWidget(
                        asset: e.asset,
                        category: e.category,
                        color: e.color,
                        isFav: e.isFav,
                        player: e.player,
                        title: e.title)
                    .pOnly(
                        top: 12,
                        left: (listCourse.indexOf(e) == 0) ? 30 : 12,
                        bottom: 12,
                        right: (listCourse.indexOf(e) == listCourse.length - 1)
                            ? 30
                            : 12),
              ))
          .toList()),
    );
  }

  Widget quizList() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: HStack(listQuiz
          .map((e) => DelayedDisplay(
                delay: Duration(milliseconds: 120 + (10 * listQuiz.indexOf(e))),
                slidingCurve: Curves.fastOutSlowIn,
                child: quizWidget(
                        asset: e.asset,
                        category: e.category,
                        color: e.color,
                        isFav: e.isFav,
                        player: e.player,
                        title: e.title)
                    .pOnly(
                        top: 12,
                        left: (listQuiz.indexOf(e) == 0) ? 30 : 12,
                        bottom: 12,
                        right: (listQuiz.indexOf(e) == listQuiz.length - 1)
                            ? 30
                            : 12),
              ))
          .toList()),
    );
  }

  Widget quizWidget(
      {int player,
      String asset,
      String title,
      bool isFav,
      String category,
      Color color}) {
    return VxBox(
        child: ZStack([
      VStack([
        ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              asset,
              width: context.percentWidth * 40,
              height: context.percentWidth * 50,
              fit: BoxFit.cover,
            )),
        title.text.textStyle(tStyle.subtitle1).make().pLTRB(12, 12, 12, 8),
        VxBox(
                child: category.text
                    .color(color)
                    .textStyle(tStyle.button)
                    .size(8)
                    .make()
                    .pSymmetric(v: 4, h: 12))
            .color(color.withOpacity(.2))
            .rounded
            .make()
            .pLTRB(12, 0, 12, 8),
        HStack([
          VxBox(
                  child:
                      player.text.textStyle(tStyle.general).size(8).bold.make())
              .roundedFull
              .p8
              .color(colors.primaryBlue)
              .make(),
          6.widthBox,
          'Played'
              .text
              .textStyle(tStyle.general)
              .size(8)
              .bold
              .color(colors.semanticBlack)
              .make()
        ]).pLTRB(12, 0, 12, 12)
      ]),
      VxBox(
              child: Icon(
                  (isFav) ? Icons.star_rounded : Icons.star_border_rounded,
                  color: (isFav) ? colors.accentPink : colors.textGrey))
          .white
          .roundedSM
          .make()
          .onTap(() {
        setState(() {
          isFav = !isFav;
        });
      }).positioned(right: 10, top: 10)
    ])).white.withRounded(value: 20).withShadow([
      BoxShadow(
        blurRadius: 40,
        color: colors.primaryBlue.withOpacity(.1),
      )
    ]).make();
  }

  Widget courseWidget(
      {int player,
      String asset,
      String title,
      bool isFav,
      String category,
      Color color}) {
    return VxBox(
            child: ZStack([
      VStack([
        ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              asset,
              width: context.percentWidth * 60,
              height: context.percentWidth * 30,
              fit: BoxFit.cover,
            )),
        title.text.textStyle(tStyle.subtitle1).make().pLTRB(12, 12, 12, 8),
        VxBox(
                child: category.text
                    .color(color)
                    .textStyle(tStyle.button)
                    .size(8)
                    .make()
                    .pSymmetric(v: 4, h: 12))
            .color(color.withOpacity(.2))
            .rounded
            .make()
            .pLTRB(12, 0, 12, 8),
        HStack([
          VxBox(
                  child:
                      player.text.textStyle(tStyle.general).size(8).bold.make())
              .roundedFull
              .p8
              .color(colors.primaryBlue)
              .make(),
          6.widthBox,
          'Played'
              .text
              .textStyle(tStyle.general)
              .size(8)
              .bold
              .color(colors.semanticBlack)
              .make()
        ]).pLTRB(12, 0, 12, 12)
      ]),
      VxBox(
              child: Icon(
                  (isFav) ? Icons.star_rounded : Icons.star_border_rounded,
                  color: (isFav) ? colors.accentPink : colors.textGrey))
          .white
          .roundedSM
          .make()
          .onTap(() {
        setState(() {
          isFav = !isFav;
        });
      }).positioned(right: 10, top: 10)
    ]))
        .white
        .withShadow([
          BoxShadow(
            blurRadius: 40,
            color: colors.primaryBlue.withOpacity(.1),
          )
        ])
        .withRounded(value: 20)
        .make();
  }

  Widget categoryList() {
    return HStack(listCategory
            .map((e) => VxBox(
                        child: e.text
                            .textStyle(tStyle.general)
                            .bold
                            .color((selectedCategory == listCategory.indexOf(e))
                                ? colors.semanticWhite
                                : colors.textGrey)
                            .make()
                            .pSymmetric(v: 4, h: 12))
                    .rounded
                    .color((selectedCategory == listCategory.indexOf(e))
                        ? colors.primaryBlue
                        : colors.semanticGrey)
                    .make()
                    .onTap(() {
                  setState(() {
                    selectedCategory = listCategory.indexOf(e);
                  });
                }).px(6))
            .toList())
        .px(24)
        .scrollHorizontal();
  }

  Widget serachBar() {
    return VxBox(
            child: HStack([
      Icon(
        Icons.search,
        color: colors.textGrey,
      ),
      12.widthBox,
      TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search Quiz',
                  hintStyle: tStyle.subtitle2.copyWith(
                    color: colors.textGrey,
                  )),
              style: tStyle.subtitle2)
          .expand()
    ]).pSymmetric(v: 4, h: 20))
        .roundedLg
        .color(colors.semanticGrey)
        .make()
        .pLTRB(30, 30, 30, 12);
  }

  Widget cardRecent(
      {String title,
      String subtitle,
      String asset,
      double progress,
      Color color}) {
    return VxBox(
            child: HStack(
      [
        ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              asset,
              width: context.percentWidth * 14,
              height: context.percentWidth * 14,
              fit: BoxFit.cover,
            )),
        12.widthBox,
        VStack(
          [
            VxBox(
                    child: title.text.medium.ellipsis
                        .textStyle(tStyle.subtitle1)
                        .make())
                .width(context.percentWidth * 50)
                .make(),
            6.heightBox,
            VxBox(
                    child: subtitle.text
                        .color(color)
                        .textStyle(tStyle.button)
                        .size(8)
                        .make()
                        .pSymmetric(v: 4, h: 12))
                .color(color.withOpacity(.2))
                .rounded
                .make(),
          ],
        ),
        0.widthBox.expand(),
        CircularPercentIndicator(
          radius: 40.0,
          lineWidth: 2.0,
          animation: true,
          percent: progress,
          center: '${(progress * 100).round()} %'.text.xs.make(),
          circularStrokeCap: CircularStrokeCap.round,
          progressColor: colors.primaryBlue,
        ),
      ],
    ).p12())
        .white
        .withShadow([
          BoxShadow(blurRadius: 40, color: colors.primaryBlue.withOpacity(.1))
        ])
        .withRounded(value: 20)
        .make()
        .pSymmetric(v: 6, h: 30);
  }

  Widget listTopItem() {
    return HStack([
      topItem(icon: Icons.star_half_outlined, number: 16, text: 'Achievement'),
      12.widthBox,
      topItem(icon: Icons.dashboard, number: 20, text: 'My Quiz'),
    ]).scrollHorizontal(physics: BouncingScrollPhysics()).pLTRB(30, 12, 30, 30);
  }

  Widget topItem({String text, IconData icon, int number}) {
    return VxBox(
            child: HStack([
      Icon(
        icon,
        color: colors.primaryBlue,
        size: 20,
      ),
      6.widthBox,
      text.text.textStyle(tStyle.general).bold.make(),
      6.widthBox,
      VxBox(
              child: number.text
                  .color(colors.primaryBlue)
                  .textStyle(tStyle.general)
                  .bold
                  .make()
                  .pSymmetric(h: 12, v: 2))
          .white
          .roundedSM
          .make()
    ]).p(8))
        .color(colors.semanticWhite.withOpacity(.3))
        .withRounded(value: 12)
        .make();
  }
}
