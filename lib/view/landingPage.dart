import 'package:flutter/material.dart';
import 'package:newvote/themes/theme.dart';
import 'package:newvote/workers/launcher_worker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  LauncherWorker launcherWorker = LauncherWorker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.lightBlue[100],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontFamily: 'Poppins'),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'VOTER',
                            style: TextStyle(color: Colors.blue)),
                        TextSpan(text: ' EDUCATION '),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "အများပြည်သူလေ့လာအသုံးပြုနိုင်ရန် \n ပွင့်လင်းမြန်မာ့ရှေ့ဆောင်မှ အခမဲ့ ဖြန့်ချိသည်။",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black54, fontSize: 10),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Image.asset(
                    'images/landingicon.png',
                    width: 70,
                    height: 70,
                  )
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(150.0),
                        topRight: Radius.circular(150.0))),
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Container(
                        padding: EdgeInsets.only(top: 60.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                width: 240,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                        icon: FaIcon(FontAwesomeIcons.facebook),
                                        iconSize: 19,
                                        onPressed: launcherWorker.launchURL,
                                        color: Colors.black38),
                                    IconButton(
                                        icon: FaIcon(FontAwesomeIcons.envelope),
                                        iconSize: 19,
                                        color: Colors.black38,
                                        onPressed: launcherWorker.launchMail),
                                    IconButton(
                                      icon: FaIcon(FontAwesomeIcons.phone),
                                      iconSize: 19,
                                      onPressed: launcherWorker.launchPhone,
                                      color: Colors.black38,
                                    ),
                                    IconButton(
                                      icon: FaIcon(FontAwesomeIcons.mapMarker),
                                      iconSize: 19,
                                      color: Colors.black38,
                                      onPressed: launcherWorker.launchLocation,
                                    ),
                                    IconButton(
                                      icon: FaIcon(FontAwesomeIcons.globe),
                                      iconSize: 19,
                                      color: Colors.black38,
                                      onPressed: launcherWorker.launchWeb,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                child: FlatButton(
                                    onPressed: () {},
                                    child: Text(
                                      "about us",
                                      style: TextStyle(fontFamily: 'Poppins'),
                                    )),
                              ),
                            )
                          ],
                        ),
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 25.0, horizontal: 20),
                          child: FlatButton(
                            child: Text('စဖတ်ရန်'),
                            color: Colors.blueAccent,
                            textColor: Colors.white,
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed('/content_listing');
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
