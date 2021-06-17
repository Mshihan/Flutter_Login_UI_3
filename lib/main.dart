import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imageview360/imageview360.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(MyApp());
}

enum pages { AboutUs, HireUs, Home, LandingPage }

enum pageView {
  ourProducts,
  ourVisionAndMission,
  MobileDevelopment,
  Designing,
  models3D,
}

enum designing {
  beforeConfirmation,
  afterConfirmation,
  initDesigning,
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter UI 3',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  double height;
  double width;
  pages page;
  pageView slide;
  designing design;
  PageController pageViewController;
  AnimationController animationController;
  double value = 0;
  List<AssetImage> imageList = List<AssetImage>();

  //Home page parameters
  double gifTopMargin = 0;
  double gifLeftMargin = 0;
  double gifWidth = 0;
  double gifHeight = 0;
  Color backColor;
  Color paragraphColor;
  double companyNameTopMargin;
  double companyNameLeftMargin;
  double solutionNameTopMargin;
  double solutionNameLeftMargin;
  double internationalBadgeTopMargin;
  double internationalBadgeLeftMargin;
  double buttonOpacity;
  double descriptionOpacity;
  double hireUsTopMargin;
  double hireUsLeftMargin;
  double pageViewOpacity;
  double placeOrderTopMargin;

  //pageView parameters
  double designImageTopMargin;
  double designImageLeftMargin;

  //image width
  double imageWidth;
  double imageHeight;

  //greeting
  double greetingTopMargin;
  double greetingLeftMargin;
  double greetingTwoTopMargin;
  double greetingTwoLeftMargin;
  double greetingTwoWidth;
  double greetingFont;

  //button
  double okButtonLeftMargin;

  //Ok label
  double okLabelLeftMargin;

  //afterConfirmation
  double afterConfirmationPicLeftMargin;
  double fadeInOpacity;

  //double up down button

  double upDownButtonTopMargin;
  double upDownLeftMargin;
  double upDownButtonTwoOpacity;

  //Mission vision page
  double ourVisionHeadingOpacity;

  @override
  void initState() {
    super.initState();
    page = pages.LandingPage;
    slide = pageView.Designing;
    landingPage();
    pageViewController = PageController();
    design = designing.initDesigning;
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    )..addListener(() {
        setState(() {
          value = animationController.value;
        });
      });

    WidgetsBinding.instance
        .addPostFrameCallback((_) => updateImageList(context));
  }

  Future landingPage() async {
    await Future.delayed(Duration(milliseconds: 3000), () {
      setState(() {
        page = pages.Home;
      });
    });
  }

  Future pageViewDesigning() async {
    await Future.delayed(Duration(milliseconds: 700), () {
      setState(() {
        design = designing.beforeConfirmation;
        //page view preview
        pageViewOpacity = 1.0;
      });
    });
  }

  Future<bool> onWillPop() async {
    setState(() {
      page = pages.Home;
        if (page == pages.AboutUs) {
          page = pages.Home;
          slide = pageView.Designing;
          animationController.reverse();
          animateToDesignPage();
        } else {
          page = pages.AboutUs;
          design = designing.initDesigning;
          slide = pageView.Designing;
        }
      });
      pageViewDesigning();setState(() {
        if (page == pages.AboutUs) {
          page = pages.Home;
          slide = pageView.Designing;
          animationController.reverse();
          animateToDesignPage();
        } else {
          page = pages.AboutUs;
          design = designing.initDesigning;
          slide = pageView.Designing;
        }

      pageViewDesigning();
    });
    return false;
  }

  Future changeToVisionAndMissionPage() async {
    await Future.delayed(Duration(milliseconds: 700), () {
      setState(() {
        slide = pageView.ourVisionAndMission;
      });
    });
  }

  Future animateToDesignPage() async {
    await Future.delayed(Duration(milliseconds: 700), () {
      pageViewController.animateTo(0.0,
          duration: Duration(milliseconds: 100), curve: Curves.fastOutSlowIn);
    });
  }

  void aboutUsPage() {
    //Gif Position
    gifWidth = 80;
    gifHeight = 80;
    gifTopMargin = height * 0.08;
    gifLeftMargin = (width) - 100;

    //Font Colors
    backColor = Colors.white;
    paragraphColor = Colors.black54;

    //Company Name Details
//    companyNameTopMargin = 80;
    companyNameTopMargin = height * 0.095;
    companyNameLeftMargin = width * 0.07;

    //Solution Details
    solutionNameTopMargin = height * 0.15;
    solutionNameLeftMargin = width * 0.07;

    //International Badge Details
    internationalBadgeTopMargin = height * 0.15;
    internationalBadgeLeftMargin = width * 0.59;

    //buttonOpacity
    buttonOpacity = 0.0;

    //description opacity
    descriptionOpacity = 0.0;

    //hire us
    hireUsTopMargin = height - 100;
    hireUsLeftMargin = width * 0.07;

    //placeholder margin
    placeOrderTopMargin = height;
  }

  void landingPageLoad() {
    //Gif Position
    gifTopMargin = height * 0.3;

    gifLeftMargin = (width / 2) - 100;
    gifHeight = 200;
    gifWidth = 200;

    //Font Colors
    backColor = Colors.black;
    paragraphColor = Colors.white;

    //Company Name Details
    companyNameTopMargin = height / 2 - 50 + 100;
    companyNameLeftMargin = width * 0.28;

    //Solution Details
    solutionNameTopMargin = height / 2 + 10 + 100;
    solutionNameLeftMargin = width * 0.25;

    //International Badge Details
    internationalBadgeTopMargin = height / 2 + 50 + 100;
    internationalBadgeLeftMargin = width * 0.45;

    //Button Opacity
    buttonOpacity = 0.0;

    //description opacity
    descriptionOpacity = 0.0;

    //hire us
    hireUsTopMargin = height;
    hireUsLeftMargin = width * 0.05;

    //page view preview
    pageViewOpacity = 0.0;

    //place order Top margin
    placeOrderTopMargin = height;
  }

  void homePageLoad() {
    //Gif Position
    gifTopMargin = 150;
    gifLeftMargin = (width / 2) - 100;
    gifHeight = 200;
    gifWidth = 200;

    //Font Colors
    backColor = Colors.black;
    paragraphColor = Colors.white;

    //Company Name Details
    companyNameTopMargin = height / 2 - 50;
    companyNameLeftMargin = width * 0.28;

    //Solution Details
    solutionNameTopMargin = height / 2 + 10;
    solutionNameLeftMargin = width * 0.25;

    //International Badge Details
    internationalBadgeTopMargin = height / 2 + 50;
    internationalBadgeLeftMargin = width * 0.45;

    //Button Opacity
    buttonOpacity = 1.0;

    //description opacity
    descriptionOpacity = 1.0;

    //hire us
    hireUsTopMargin = height - 150;
    hireUsLeftMargin = width * 0.05;

    //page view preview
    pageViewOpacity = 0.0;

    //place orderTop margin
    placeOrderTopMargin = height - 150;
  }

  void designInitLoad() {
    designImageTopMargin = height * 0.25;
    designImageLeftMargin = width;
    imageWidth = width * 0.7;
    imageHeight = 250;
    greetingTopMargin = height * 0.55;
    greetingLeftMargin = width;
    greetingTwoTopMargin = height * 0.65;
    greetingTwoLeftMargin = width;
    greetingTwoWidth = 300;
    okButtonLeftMargin = width;
    afterConfirmationPicLeftMargin = width;
    fadeInOpacity = 0.0;
    okLabelLeftMargin = width;
  }

  void designAfterConfirmationLoad() {
    designImageTopMargin = height * 0.2;
    designImageLeftMargin = 30;
    imageWidth = 200;
    imageHeight = 200;
    greetingTopMargin = height * 0.25;
    greetingLeftMargin = width * 0.6;
    greetingTwoTopMargin = height * 0.3;
    greetingTwoLeftMargin = width * 0.6;
    greetingTwoWidth = 150;
    okButtonLeftMargin = width;
    afterConfirmationPicLeftMargin = width * 0.55;
    fadeInOpacity = 1.0;
    okLabelLeftMargin = width * 0.8;
  }

  void designBeforeConfirmationLoad() {
    designImageTopMargin = height * 0.25;
    designImageLeftMargin = 60;
    imageWidth = width * 0.7;
    imageHeight = 250;
    greetingTopMargin = height * 0.55;
    greetingLeftMargin = width * 0.3;
    greetingTwoTopMargin = height * 0.65;
    greetingTwoLeftMargin = width * 0.18;
    greetingTwoWidth = 300;
    okButtonLeftMargin = width * 0.6;
    afterConfirmationPicLeftMargin = width;
    fadeInOpacity = 0.0;
    okLabelLeftMargin = width;
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    switch (page) {
      case pages.AboutUs:
        aboutUsPage();
        break;
      case pages.HireUs:
        break;
      case pages.LandingPage:
        landingPageLoad();
        break;
      case pages.Home:
        homePageLoad();
        break;
    }

    switch (design) {
      case designing.initDesigning:
        designInitLoad();
        break;
      case designing.afterConfirmation:
        designAfterConfirmationLoad();
        break;
      case designing.beforeConfirmation:
        designBeforeConfirmationLoad();
        break;
    }

    switch (slide) {
      case pageView.Designing:
        upDownButtonTopMargin = height * 0.89;
        upDownLeftMargin = width * 0.67;
        upDownButtonTwoOpacity = 0.0;
        ourVisionHeadingOpacity = 0.0;
        break;
      case pageView.ourVisionAndMission:
        upDownButtonTopMargin = height * 0.89;
        upDownLeftMargin = width * 0.58;
        upDownButtonTwoOpacity = 1.0;
        ourVisionHeadingOpacity = 1.0;
        break;
      case pageView.models3D:
        upDownButtonTopMargin = height * 0.89;
        upDownLeftMargin = width * 0.58;
        upDownButtonTwoOpacity = 1.0;
        ourVisionHeadingOpacity = 0.0;
        break;
      case pageView.MobileDevelopment:
        upDownButtonTopMargin = height * 0.89;
        upDownLeftMargin = width * 0.58;
        upDownButtonTwoOpacity = 1.0;
        break;
      case pageView.ourProducts:
        upDownButtonTopMargin = height * 0.89;
        upDownLeftMargin = width * 0.58;
        upDownButtonTwoOpacity = 1.0;
        ourVisionHeadingOpacity = 0.0;
        break;
    }

    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            //BackColor
            AnimatedContainer(
              duration: Duration(milliseconds: 500),
              color: Colors.white,
              width: width,
              height: height,
            ),

            //PageView
            AnimatedOpacity(
              opacity: pageViewOpacity,
              duration: Duration(milliseconds: 500),
              curve: Curves.easeIn,
              child: Stack(
                children: [
                  //Page View
                  Container(
                    height: height,
                    width: width,
                    color: Colors.white,
                    child: PageView(
                      scrollDirection: Axis.vertical,
                      controller: pageViewController,
                      physics: NeverScrollableScrollPhysics(),
                      children: <Widget>[
//                        Designing Page
                        Container(
                          height: height,
                          width: width,
                          child: Stack(
                            children: <Widget>[
                              //Designer Image
                              AnimatedContainer(
                                duration: Duration(milliseconds: 500),
                                height: imageHeight,
                                width: imageWidth,
                                margin: EdgeInsets.only(
                                    top: designImageTopMargin,
                                    left: designImageLeftMargin),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('images/designer.png'),
                                      fit: BoxFit.cover),
                                ),
                              ),

                              //Hello and greeting
                              AnimatedContainer(
                                curve: Curves.fastOutSlowIn,
                                duration: Duration(milliseconds: 500),
                                margin: EdgeInsets.only(
                                    top: greetingTopMargin,
                                    left: greetingLeftMargin),
                                child: Text(
                                  'Hey, there!!',
                                  style: GoogleFonts.sriracha(
                                      fontSize: 20 + 15 - (15 * value),
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              AnimatedContainer(
                                curve: Curves.fastOutSlowIn,
                                width: greetingTwoWidth,
                                duration: Duration(milliseconds: 500),
                                margin: EdgeInsets.only(
                                    top: greetingTwoTopMargin,
                                    left: greetingTwoLeftMargin),
                                child: Text(
                                  'Looking for a software solution or a designing'
                                  ' solution?? ',
                                  style: GoogleFonts.sriracha(
                                      fontSize: 14 + 5 - (5 * value),
                                      height: 1.3,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),

                              //Ok button
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (design == designing.afterConfirmation) {
                                      design = designing.beforeConfirmation;
                                      animationController.reverse(
                                        from: 1,
                                      );
                                    } else {
                                      design = designing.afterConfirmation;
                                      animationController.forward();
                                    }
                                  });
                                },
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 600),
                                  curve: Curves.fastOutSlowIn,
                                  margin: EdgeInsets.only(
                                      top: height * 0.75,
                                      left: okButtonLeftMargin),
                                  width: 100,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.black,
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Yes..",
                                      style: GoogleFonts.sriracha(
                                          fontSize: 18, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              AnimatedContainer(
                                duration: Duration(milliseconds: 1200),
                                curve: Curves.fastOutSlowIn,
                                margin: EdgeInsets.only(
                                    top: 320, left: okLabelLeftMargin),
                                child: Text(
                                  "Yes ...",
                                  style: GoogleFonts.sriracha(
                                    fontSize: 15,
                                  ),
                                ),
                              ),

                              //After Conformation Pic
                              AnimatedContainer(
                                duration: Duration(milliseconds: 600),
                                curve: Curves.fastOutSlowIn,
                                height: 180,
                                width: 180,
                                margin: EdgeInsets.only(
                                    top: height * 0.45,
                                    left: afterConfirmationPicLeftMargin),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('images/mobileAppCoding'
                                          '.png'),
                                      fit: BoxFit.cover),
                                ),
                              ),

                              AnimatedOpacity(
                                opacity: fadeInOpacity,
                                duration: Duration(milliseconds: 700),
                                curve: Curves.fastOutSlowIn,
                                child: Container(
                                  width: 180,
                                  margin: EdgeInsets.only(
                                      top: height * 0.48, left: width * 0.1),
                                  child: Text(
                                    'Congratulations!',
                                    style: GoogleFonts.sriracha(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              AnimatedOpacity(
                                opacity: fadeInOpacity,
                                duration: Duration(milliseconds: 700),
                                curve: Curves.fastOutSlowIn,
                                child: Container(
                                  width: 180,
                                  margin: EdgeInsets.only(
                                      top: height * 0.53, left: width * 0.1),
                                  child: Text(
                                    'You are looking at one of the best options in '
                                    'software solution industry',
                                    style: GoogleFonts.sriracha(
                                      fontSize: 14,
                                      height: 1.3,
                                    ),
                                  ),
                                ),
                              ),

                              //After Conformation Pic 2
                              AnimatedOpacity(
                                opacity: fadeInOpacity,
                                duration: Duration(milliseconds: 700),
                                curve: Curves.fastOutSlowIn,
                                child: Container(
                                  height: 150,
                                  width: 150,
                                  margin: EdgeInsets.only(
                                      top: height * 0.68, left: width * 0.1),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'images/crossPlatformDevelopment'
                                            '.png'),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              ),
                              AnimatedContainer(
                                curve: Curves.fastOutSlowIn,
                                width: 170,
                                duration: Duration(milliseconds: 500),
                                margin: EdgeInsets.only(
                                    top: height * 0.7,
                                    left: afterConfirmationPicLeftMargin),
                                child: Text(
                                  "Let's know more about Moonwalk Software "
                                  "Solutions.\n\n\n Have a ride with us!!!\n "
                                  "Click here",
                                  style: GoogleFonts.sriracha(
                                    fontSize: 16,
                                    height: 1.3,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        //Vision and Mission page
                        Container(
                          height: height,
                          width: width,
                          child: Stack(
                            children: <Widget>[
                              //Our vision
                              AnimatedOpacity(
                                opacity: ourVisionHeadingOpacity,
                                duration: Duration(milliseconds: 400),
                                curve: Curves.fastOutSlowIn,
                                child: Container(
                                  margin: EdgeInsets.only(
                                      top: height * 0.25, left: width * 0.08),
                                  child: Text(
                                    "Our Vision",
                                    style: GoogleFonts.lobster(fontSize: 35),
                                  ),
                                ),
                              ),
                              //Vision Image
                              AnimatedOpacity(
                                opacity: ourVisionHeadingOpacity,
                                duration: Duration(milliseconds: 600),
                                curve: Curves.fastOutSlowIn,
                                child: Container(
                                  margin: EdgeInsets.only(
                                      top: height * 0.23, left: width * 0.55),
                                  width: 200,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "images/visionAndMission.png"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              // Our Vision paragraph
                              AnimatedOpacity(
                                opacity: ourVisionHeadingOpacity,
                                duration: Duration(milliseconds: 1000),
                                curve: Curves.fastOutSlowIn,
                                child: Container(
                                  width: width * 0.45,
                                  margin: EdgeInsets.only(
                                      top: height * 0.32, left: width * 0.08),
                                  child: Text(
                                    'Enabling enterprises and '
                                    'customers to leverage technology for '
                                    'business growth and success.',
                                    style: GoogleFonts.sriracha(
                                        fontSize: 17, height: 1.3),
                                  ),
                                ),
                              ),
                              //Our Mission
                              AnimatedOpacity(
                                opacity: ourVisionHeadingOpacity,
                                duration: Duration(milliseconds: 1400),
                                curve: Curves.fastOutSlowIn,
                                child: Container(
                                  margin: EdgeInsets.only(
                                      top: height * 0.47, left: width * 0.55),
                                  child: Text(
                                    "Our Mission",
                                    style: GoogleFonts.lobster(fontSize: 35),
                                  ),
                                ),
                              ),
                              //Mission Image
                              AnimatedOpacity(
                                opacity: ourVisionHeadingOpacity,
                                duration: Duration(milliseconds: 1600),
                                curve: Curves.fastOutSlowIn,
                                child: Container(
                                  margin: EdgeInsets.only(
                                      top: height * 0.48, left: width * 0.05),
                                  width: 200,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "images/nextLevelDesigns.png"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              // Our mission paragraph
                              AnimatedOpacity(
                                opacity: ourVisionHeadingOpacity,
                                duration: Duration(milliseconds: 2000),
                                curve: Curves.fastOutSlowIn,
                                child: Container(
                                  width: width * 0.4,
                                  margin: EdgeInsets.only(
                                      top: height * 0.55, left: width * 0.55),
                                  child: Text(
                                    'Delivering innovative and '
                                    'reliable solutions and designs to meet '
                                    'our clients '
                                    'needs with utmost quality and unwavering'
                                    ' ethics.',
                                    style: GoogleFonts.sriracha(
                                        fontSize: 17, height: 1.3),
                                  ),
                                ),
                              ),
                              // Services page
                              AnimatedOpacity(
                                opacity: ourVisionHeadingOpacity,
                                duration: Duration(milliseconds: 2500),
                                curve: Curves.easeIn,
                                child: Container(
                                  margin: EdgeInsets.only(
                                      top: height * 0.735, left: width * 0.55),
                                  child: Text(
                                    "Checkout our services \n\n\n\n Go "
                                    "Down"
                                    "...!",
                                    style: GoogleFonts.sriracha(
                                        fontSize: 17,
                                        height: 1.3,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                              //Mission Image
                              AnimatedOpacity(
                                opacity: ourVisionHeadingOpacity,
                                duration: Duration(milliseconds: 2500),
                                curve: Curves.easeIn,
                                child: Container(
                                  margin: EdgeInsets.only(
                                      top: height * 0.7, left: width * 0.07),
                                  width: 200,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage("images/services.png"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        //Products and Services
                        Container(
                          color: Colors.white,
                          height: height,
                          width: width,
                          child: Stack(
                            children: <Widget>[
                              //Our Products
                              Container(
                                margin: EdgeInsets.only(
                                    top: height * 0.25, left: width * 0.08),
                                child: Text(
                                  "Our Products and Services",
                                  style: GoogleFonts.lobster(fontSize: 32),
                                ),
                              ),
                              //First Image
                              Container(
                                margin: EdgeInsets.only(
                                    top: height * 0.32, left: 20),
                                height: 150,
                                width: 200,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("images/crossPlatform"
                                        ".png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              //first paragraph
                              Container(
                                width: width * 0.4,
                                margin: EdgeInsets.only(
                                    top: height * 0.38, left: width * 0.55),
                                child: Text(
                                  "We provide futuristic mobile "
                                  "apps in native platforms and desktop "
                                  "software's as"
                                  " well as websites.",
                                  style: GoogleFonts.sriracha(
                                      fontSize: 17, height: 1.3),
                                ),
                              ),
                              //second paragraph
                              Container(
                                width: width * 0.4,
                                margin: EdgeInsets.only(
                                    top: height * 0.56, left: width * 0.08),
                                child: Text(
                                  "Looking for a logo or leaflet"
                                  " designers?...\nYou are in the correct "
                                  "place",
                                  style: GoogleFonts.sriracha(
                                      fontSize: 17, height: 1.3),
                                ),
                              ),
                              //First Image
                              Container(
                                margin: EdgeInsets.only(
                                    top: height * 0.55, left: width * 0.55),
                                height: 120,
                                width: 180,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("images/logoDesigner"
                                        ".png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              //checkout products
                              Container(
                                width: 180,
                                height: 40,
                                margin: EdgeInsets.only(
                                    top: height * 0.74, left: width * 0.07),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.black26,
                                ),
                                child: Center(
                                  child: Text(
                                    "Product and services",
                                    style: GoogleFonts.sriracha(fontSize: 15),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    top: height * 0.745, left: width * 0.55),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.arrow_back,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "For more details",
                                      style: GoogleFonts.sriracha(fontSize: 16),
                                    )
                                  ],
                                ),
                              ),
                              //impressed
                              Container(
                                margin: EdgeInsets.only(
                                    top: height * 0.81, left: width * 0.55),
                                child: Text(
                                  "Impressed ?? No ??\n\n Click here",
                                  style: GoogleFonts.sriracha(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      height: 1.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                        //3D object page and products(mobile)
                        Container(
                          color: Colors.white,
                          height: height,
                          width: width,
                          child: Stack(
                            children: <Widget>[
                              //Futuristic mobile apps
                              Container(
                                margin: EdgeInsets.only(
                                    top: height * 0.25, left: width * 0.08),
                                child: Text(
                                  "Futuristic mobile apps",
                                  style: GoogleFonts.lobster(fontSize: 32),
                                ),
                              ),
                              //Audi image
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          child: ModelViews(
                                            imageList: imageList,
                                          )));
                                  print('selecting');
                                },
                                child: Hero(
                                  tag: 'audi',
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        top: height * 0.32, left: 20),
                                    height: 180,
                                    width: 180,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black, width: 1),
                                      image: DecorationImage(
                                        image: AssetImage(
                                          "images/Audi/audi (1)"
                                          ".png",
                                        ),
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              //Hire us
                              Container(
                                width: width * 0.4,
                                margin: EdgeInsets.only(
                                    top: height * 0.335, left: width * 0.55),
                                child: Text(
                                  "Hire us and provide 3D experience"
                                  " to your customers. We model it for you."
                                  " Find exceptional Animations and "
                                  "designs with us",
                                  style: GoogleFonts.sriracha(
                                      fontSize: 17, height: 1.3),
                                ),
                              ),
                              //Click Above
                              Container(
                                width: width * 0.4,
                                margin: EdgeInsets.only(
                                    top: height * 0.56, left: width * 0.08),
                                child: Text(
                                  "Click Above image!!!",
                                  style: GoogleFonts.sriracha(
                                      fontSize: 17, height: 1.3),
                                ),
                              ),


                            ],
                          ),
                        ),

                        
                      ],
                    ),
                  ),
                  //Have a ride down button (Down Button)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (slide == pageView.Designing) {
                          changeToVisionAndMissionPage();
                          pageViewController.animateToPage(1,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.fastOutSlowIn);
                        } else if (slide == pageView.ourVisionAndMission) {
                          slide = pageView.ourProducts;
                          pageViewController.animateToPage(2,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.fastOutSlowIn);
                        } else if (slide == pageView.ourProducts) {
                          slide = pageView.models3D;
                          pageViewController.animateToPage(3,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.fastOutSlowIn);
                        }
                      });
                    },
                    child: AnimatedOpacity(
                      opacity: fadeInOpacity,
                      duration: Duration(milliseconds: 700),
                      curve: Curves.fastOutSlowIn,
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 600),
                        margin: EdgeInsets.only(
                            top: upDownButtonTopMargin, left: upDownLeftMargin),
                        child: Container(
                          width: 65,
                          height: 65,
                          decoration: BoxDecoration(
                            color: Colors.black38,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Container(
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  //Have a ride up button (Up Button)
                  AnimatedOpacity(
                    duration: Duration(milliseconds: 600),
                    curve: Curves.fastOutSlowIn,
                    opacity: upDownButtonTwoOpacity,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (slide == pageView.ourVisionAndMission) {
                            slide = pageView.Designing;
                            pageViewController.animateToPage(0,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.fastOutSlowIn);
                          } else if (slide == pageView.ourProducts) {
                            slide = pageView.ourVisionAndMission;
                            pageViewController.animateToPage(1,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.fastOutSlowIn);
                          } else if (slide == pageView.models3D) {
                            slide = pageView.ourProducts;
                            pageViewController.animateToPage(2,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.fastOutSlowIn);
                          }
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            top: height * 0.89, left: width * 0.78),
                        width: 65,
                        height: 65,
                        decoration: BoxDecoration(
                          color: Colors.black38,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Container(
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.keyboard_arrow_up,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            AnimatedOpacity(
              opacity: pageViewOpacity,
              duration: Duration(milliseconds: 500),
              curve: Curves.fastOutSlowIn,
              child: Container(
                width: width,
                height: 200,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  colors: [
                    Colors.white,
                    Colors.white,
                    Colors.white,
                    Colors.white,
                    Colors.white,
                    Colors.white,
                    Colors.white,
                    Colors.white,
                    Colors.white,
                    Colors.white,
                    Colors.white,
                    Colors.white.withOpacity(0.0),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )),
              ),
            ),

            //Company Name
            AnimatedContainer(
              duration: Duration(milliseconds: 500),
              curve: Curves.fastOutSlowIn,
              width: width,
              margin: EdgeInsets.only(
                  top: companyNameTopMargin, left: companyNameLeftMargin),
              child: Text(
                "Moonwalk",
                textAlign: TextAlign.left,
                style: GoogleFonts.viga(
                  fontSize: 40,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 600),
              curve: Curves.fastOutSlowIn,
              width: width,
              margin: EdgeInsets.only(
                  top: solutionNameTopMargin, left: solutionNameLeftMargin),
              child: Text(
                "Software Solutions",
                style: GoogleFonts.viga(
                  fontSize: 25,
                  fontWeight: FontWeight.w200,
                  color: Colors.black,
                ),
              ),
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 800),
              curve: Curves.fastOutSlowIn,
              width: width,
              margin: EdgeInsets.only(
                top: internationalBadgeTopMargin,
                left: internationalBadgeLeftMargin,
              ),
              child: Text(
                "Int'l",
                style: GoogleFonts.viga(
                  fontWeight: FontWeight.w400,
                  fontSize: 25,
                  color: Colors.black,
                ),
              ),
            ),

            //Description
            AnimatedOpacity(
              opacity: descriptionOpacity,
              duration: Duration(milliseconds: 100),
              curve: Curves.fastOutSlowIn,
              child: Container(
                margin:
                    EdgeInsets.only(top: height / 2 + 135, left: 80, right: 80),
                width: width,
                child: Text(
                  "Best option for your problems, Our wizards make your "
                  "problems disappear with in no time",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    fontStyle: FontStyle.italic,
                    fontSize: 18,
                    height: 1.4,
                    color: Colors.black,
                  ),
                ),
              ),
            ),

            //Animated Gif
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeIn,
              margin: EdgeInsets.only(top: gifTopMargin, left: gifLeftMargin),
              width: gifWidth,
              height: gifHeight,
              decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(50),
                  image: DecorationImage(
                    image: AssetImage("images/loading.gif"),
                  )),
            ),

            //About Us
            GestureDetector(
              onTap: () {
                setState(() {
                  if (page == pages.AboutUs) {
                    page = pages.Home;
                    slide = pageView.Designing;
                    animationController.reverse();
                    animateToDesignPage();
                  } else {
                    page = pages.AboutUs;
                    design = designing.initDesigning;
                    slide = pageView.Designing;
                  }
                });
                pageViewDesigning();
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                width: 180,
                height: 80,
                margin: EdgeInsets.only(
                    top: hireUsTopMargin, left: hireUsLeftMargin),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black38,
                        blurRadius: 20,
                        offset: Offset(0, 5)),
                  ],
                ),
                child: Center(
                  child: Text(
                    page == pages.Home ? "About Us" : "Back To Home",
                    style: GoogleFonts.viga(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),

            //Place Order
            AnimatedOpacity(
              opacity: buttonOpacity,
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInCirc,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                width: 180,
                height: 80,
                margin: EdgeInsets.only(top: placeOrderTopMargin, left: 220),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Hire Us",
                    style: GoogleFonts.viga(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void updateImageList(BuildContext context) async {
    for (int i = 1; i <= 300; i = i + 6) {
      imageList.add(AssetImage('images/Audi/audi ($i).png'));
      await precacheImage(
          AssetImage(
            'images/Audi/audi ($i).png',
          ),
          context);
      print(i);
    }
  }
}

//lato fall font
//viga main font

class ModelViews extends StatefulWidget {
  ModelViews({this.imageList});

  final List<AssetImage> imageList;

  @override
  _ModelViewsState createState() => _ModelViewsState();
}

class _ModelViewsState extends State<ModelViews> {
  bool autoRotate = true;
  int rotationCount = 2;
  int swipeSensitivity = 2;
  bool allowSwipeToRotate = true;
  RotationDirection rotationDirection = RotationDirection.anticlockwise;
  Duration frameChangeDuration = Duration(milliseconds: 50);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 300,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2)),
            child: Hero(
              tag: "audi",
              child: ImageView360(
                key: UniqueKey(),
                imageList: widget.imageList,
                autoRotate: false,
                rotationCount: 0,
                rotationDirection: RotationDirection.clockwise,
                frameChangeDuration: Duration(milliseconds: 60),
                swipeSensitivity: 1,
                allowSwipeToRotate: true,
                onImageIndexChanged: (currentImageIndex) {
                  print("currentImageIndex: $currentImageIndex");
                },
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Text(
              'Swipe above "3D model" to see it in different '
              'perspectives',
              textAlign: TextAlign.center,
              style: GoogleFonts.sriracha(
                fontSize: 12,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'MSSI rent a cars',
              textAlign: TextAlign.center,
              style: GoogleFonts.lobster(
                fontSize: 35,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            child: Text(
              'Rent a car confirmation',
              textAlign: TextAlign.center,
              style: GoogleFonts.sriracha(
                fontSize: 20,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 0),
            child: Text(
              'Vehicle Reg No: *********',
              textAlign: TextAlign.center,
              style: GoogleFonts.sriracha(
                fontSize: 15,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            child: Text(
              'Model : Audi ***',
              textAlign: TextAlign.center,
              style: GoogleFonts.sriracha(
                fontSize: 15,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            child: Text(
              'Status : Available',
              textAlign: TextAlign.center,
              style: GoogleFonts.sriracha(
                fontSize: 15,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            child: Text(
              'Rent rate (Km) : 2\$ per Km',
              textAlign: TextAlign.center,
              style: GoogleFonts.sriracha(
                fontSize: 15,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            child: Text(
              'Rent rate (Day): 40\$ per day',
              textAlign: TextAlign.center,
              style: GoogleFonts.sriracha(
                fontSize: 15,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Payment type:',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.sriracha(
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: 40,
                  width: 80,
                  color: Colors.black26,
                  child: Center(
                    child: Text(
                      'Cash',
                      style: GoogleFonts.sriracha(
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: 40,
                  width: 80,
                  color: Colors.black,
                  child: Center(
                    child: Text(
                      'Card',
                      style: GoogleFonts.sriracha(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Customer Review:',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.sriracha(
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.star,
                  color: Colors.black,
                ),
                Icon(
                  Icons.star,
                  color: Colors.black,
                ),
                Icon(
                  Icons.star,
                  color: Colors.black,
                ),
                Icon(
                  Icons.star,
                  color: Colors.black,
                ),
                Icon(
                  Icons.star_half,
                  color: Colors.black,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Text(
              'You will receive a call from our staff to confirm your order',
              textAlign: TextAlign.center,
              style: GoogleFonts.sriracha(
                fontSize: 13,
                color: Colors.grey,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            alignment: Alignment.centerLeft,
            height: 60,
            width: 120,
            color: Colors.black,
            child: Center(
              child: Text(
                'Book',
                style: GoogleFonts.sriracha(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
