import 'package:flutter/material.dart';
import 'dart:convert';
import '../widgets/modal.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../themes/theme.dart';

Modal modal = new Modal();

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        elevation: 0,
        titleSpacing: 0.0,
        backgroundColor: AppTheme.lightTheme.primaryColor,
        title: Text(
          "ကျွန်ုပ်တို့အကြောင်း",
          style: TextStyle(fontSize: 19, color: Colors.black),
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 11,
              child: FutureBuilder(
                future: DefaultAssetBundle.of(context)
                    .loadString('load-json/about.json'),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var mydata = jsonDecode(snapshot.data.toString());
                    return ListView.builder(
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              mydata[index]['bigTitle'] != null
                                  ? Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20.0),
                                      child: Text(
                                        mydata[index]['bigTitle'],
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  : SizedBox(
                                      height: 0.0,
                                    ),
                              Text(
                                "" + mydata[index]['title'],
                                style: TextStyle(
                                    fontSize: 18.0,
                                    height: 3.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "" + mydata[index]['text'],
                                style: TextStyle(height: 2.0, fontSize: 15.0),
                              ),
                              SizedBox(
                                height: 20.0,
                              )
                            ],
                          ),
                        );
                      },
                      itemCount: mydata.length,
                    );
                  } else {
                    return SpinKitSquareCircle(
                      color: AppTheme.lightTheme.primaryColor,
                      size: 50.0,
                    );
                  }
                },
              ),
            ),
            FlatButton(
              color: AppTheme.lightTheme.primaryColor,
              onPressed: () => {
                modal.mainBottomSheet(context),
              },
              child: RichText(
                text: TextSpan(
                  text: "OMI မှထုတ်ဝေခဲ့သော ",
                  style: TextStyle(color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                      text: "Mobile App ",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    TextSpan(text: " များ"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
