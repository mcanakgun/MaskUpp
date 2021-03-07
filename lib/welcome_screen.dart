import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:wear_mask/themes/styles.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? kThemecolor : Color(0xffD6D6D6),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffaf8ed),
      body: SingleChildScrollView(
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Container(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerRight,
                    // ignore: deprecated_member_use
                    child: FlatButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/Login");
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Skip',
                            style: TextStyle(
                              color: Color(0xff7660d8),
                              fontSize: 20.0,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_sharp,
                            color: Color(0xff7660d8),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 550.0,
                    child: PageView(
                      physics: ClampingScrollPhysics(),
                      controller: _pageController,
                      onPageChanged: (int page) {
                        setState(() {
                          _currentPage = page;
                        });
                      },
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(40.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Center(
                                child: Lottie.asset(
                                  "assets/PurpleMask.json",
                                  height: 300,
                                  width: 300,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Card(
                                elevation: 10,
                                child: Container(
                                  margin: EdgeInsets.all(10),
                                  child: Text(
                                    'Do You Know That Every Year Around 7 Million People Die Due To The Air Pollution?',
                                    style: kTitleStyle,
                                  ),
                                ),
                                color: Color(0xff7660d8),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                              SizedBox(height: 15.0),
                              Text(
                                '',
                                style: kSubtitleStyle,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(40.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Center(
                                  child: Image(
                                height: 300,
                                width: 300,
                                image: AssetImage(
                                  'assets/WelcomeScreenPollution.png',
                                ),
                              )),
                              Card(
                                elevation: 10,
                                child: Container(
                                  margin: EdgeInsets.all(10),
                                  child: Text(
                                    'MaskUpp Notifies People When They Enter A Heavily Polluted Area and Recommends Them To Wear a Mask.',
                                    style: kTitleStyle,
                                  ),
                                ),
                                color: Color(0xff7660d8),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(40, 60, 40, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Center(
                                child: Image(
                                  image: AssetImage(
                                    'assets/LogoTransparent.png',
                                  ),
                                  height: 250.0,
                                  width: 250.0,
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Card(
                                elevation: 10,
                                child: Container(
                                  margin: EdgeInsets.all(10),
                                  child: Text(
                                    'Follow Notifications and Stay Healthy with MaskUpp',
                                    style: kTitleStyle,
                                  ),
                                ),
                                color: Color(0xff7660d8),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildPageIndicator(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(50),
                    // ignore: deprecated_member_use
                    child: FlatButton(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      color: Color(0xffcaaaf3),
                      onPressed: () {
                        Navigator.pushNamed(context, "/Login");
                      },
                      child: Text(
                        _currentPage != _numPages - 1 ? 'Next' : 'Get Started',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
