import 'package:flutter/material.dart';
import 'dart:convert';
import '../workers/databrain.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:newvote/themes/theme.dart';

// ignore: camel_case_types
class Content_Listing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        elevation: 0,
        titleSpacing: 0.0,
        backgroundColor: AppTheme.lightTheme.primaryColor,
        title: RichText(
          text: TextSpan(
            style: TextStyle(
                color: Colors.black, fontSize: 19, fontFamily: 'Poppins'),
            children: <TextSpan>[
              TextSpan(
                text: ' VOTER',
                style: TextStyle(color: Colors.blue),
              ),
              TextSpan(
                text: ' EDUCATION',
              ),
            ],
          ),
        ),
        actions: <Widget>[
          new IconButton(
              icon: Icon(
                Icons.info_outline,
                color: Colors.black,
              ),
              onPressed: () => Navigator.of(context).pushNamed('/aboutus')),
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 16,
              child: FutureBuilder(
                future: DefaultAssetBundle.of(context)
                    .loadString('load-json/content_data.json'),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    var mydata = jsonDecode(snapshot.data.toString());
                    return ListView.builder(
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              new Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 4.0, horizontal: 8.0),
                                child: Wrap(
                                  children: <Widget>[
                                    FlatButton(
                                      padding: EdgeInsets.all(0),
                                      onPressed: () =>
                                          Navigator.of(context).pushNamed(
                                        '/content_list_view_${mydata[index]['contentNumber']}',
                                        arguments: Data(
                                          title: mydata[index]['title'],
                                          subtitle: mydata[index]['subtitle'],
                                          contentNumber: mydata[index]
                                              ['contentNumber'],
                                        ),
                                      ),
                                      child: Container(
                                        constraints: BoxConstraints(
                                          minHeight: 100,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          color: Colors.lightBlue[200],
                                        ),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Image.asset(
                                                'images/leading_image.png',
                                                width: 60.0,
                                                height: 60.0,
                                              ),
                                            ),
                                            Expanded(
                                                flex: 3,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        'အခန်း ( ${mydata[index]['index']} ) ',
                                                      ),
                                                      Text(mydata[index]
                                                          ['title'])
                                                    ],
                                                  ),
                                                ))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                      itemCount: mydata.length,
                    );
                  } else {
                    return SpinKitSquareCircle(
                      color: Colors.lightBlue,
                      size: 50.0,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
