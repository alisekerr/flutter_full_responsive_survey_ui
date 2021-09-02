import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_ui_desing_1/models/contents.dart';


class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
List<Contents> icerikListesi = [
    Contents(
      title: "Nature Surveys",
      imagePath: 'assets/images/doga.png',
      about:
          'Hello Ali, we are sending you nature-related surveys for you to participate.',
    ),
    Contents(
      title: "Technology Surveys",
      imagePath: 'assets/images/tec.png',
      about:
          'Hello Ali, we are sending you technology related surveys for you to participate.',
    ),
    Contents(
      title: "Sports Surveys",
      imagePath: 'assets/images/spor.png',
      about:
          'Hello Ali, we are sending you sports related surveys for you to participate.',
    ),
    Contents(
      title: "Entertainment Surveys",
      imagePath: 'assets/images/eglence.png',
      about:
          'Hello Ali, we send you entertainment related surveys for you to participate. ',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "SURVEY INBOX",
          style: Theme.of(context).textTheme.headline5,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.dehaze),
          onPressed: () {},
          color: Colors.black,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.keyboard_arrow_right),
            onPressed: () {},
            color: Colors.black,
          ),
        ],
      ),
      body: buildListBuilder(),
    );
  }

  ListView buildListBuilder() {
    return ListView.builder(
      itemCount: icerikListesi.length,
      itemBuilder: (context, index) => Card(
        color: Colors.transparent,
        elevation: 0,
        child: CardDesing(
          title: icerikListesi[index].title,
          about: icerikListesi[index].about,
          imagePath: icerikListesi[index].imagePath,
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CardDesing extends StatelessWidget {
  String title;
  String imagePath;
  String about;
  CardDesing({
    Key? key,
    required this.title,
    required this.imagePath,
    required this.about,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    var screenInfo=MediaQuery.of(context);
    final double screenWidth=screenInfo.size.width;

    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      child: Column(
        children: [
          Expanded(
              child: GestureDetector(
            onTap: () {},
            child: buildCardDecoration(screenWidth, context),
          )),
        ],
      ),
    );
  }

  Container buildCardDecoration(double screenWidth, BuildContext context) {
    return Container(
              margin: EdgeInsets.symmetric(
                  horizontal: screenWidth>750 ? MediaQuery.of(context).size.width * 0.2:MediaQuery.of(context).size.width * 0.05,
                  vertical: MediaQuery.of(context).size.height * 0.03),
              decoration: buildCardBoxDecoration(),
              child: Column(
                children: [
                  buildCardImage(),
                  buildCardTitle(context),
                  buildCardAbout(context),
                ],
              ));
  }

  BoxDecoration buildCardBoxDecoration() {
    return BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueGrey,
                    spreadRadius: 3,
                    blurRadius: 8,
                    offset: Offset(0, 5),
                  ),
                ],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                ));
  }

  Expanded buildCardImage() {
    return Expanded(
                  flex: 4,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: Image.asset(imagePath).image,
                          fit: BoxFit.cover),
                    ),
                  ),
                );
  }

  Expanded buildCardTitle(BuildContext context) {
    return Expanded(
                    flex: 1,
                    child: Text(
                      title,
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(color: Colors.black),
                    ));
  }

  Expanded buildCardAbout(BuildContext context) {
    return Expanded(
                    flex: 2,
                    child: Text(
                      about,
                      style: Theme.of(context).textTheme.subtitle1,
                    ));
  }

  

  
}
