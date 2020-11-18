import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newvote/workers/databrain.dart';
import 'package:newvote/themes/theme.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:convert';
import 'dart:ui';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:expandable/expandable.dart';
import 'dart:io';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:connectivity/connectivity.dart';

// ignore: must_be_immutable
class ContentListViewThirteen extends StatelessWidget {
  final Data data;
  ContentListViewThirteen({
    Key key,
    @required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
    new GlobalKey<ScaffoldState>();
    final copied = ClipboardData(text: "text");
    Clipboard.setData(copied);
    _showSnackBar() {
      print("Show Snackbar here !");
      final snackBar = new SnackBar(
          content: new Text("Copied to Clipboard"),
          duration: new Duration(seconds: 2),
          backgroundColor: Colors.lightBlueAccent);

      _scaffoldKey.currentState.showSnackBar(snackBar);
    }

    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          leading: BackButton(color: Colors.black),
          elevation: 0,
          titleSpacing: 0.0,
          backgroundColor: AppTheme.lightTheme.primaryColor,
          title: Text(
            data.subtitle,
            style: TextStyle(fontSize: 19, color: Colors.black),
          ),
        ),
        body: Container(
          color: Colors.white,
          child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('load-json/mel.json'),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                var mydata = jsonDecode(snapshot.data.toString());
                return ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Container(
                                child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      child: FlatButton(
                                        padding: EdgeInsets.all(0),
                                        onPressed: () async {
                                          var connectivityResult =
                                          await (Connectivity()
                                              .checkConnectivity());
                                          if (connectivityResult ==
                                              ConnectivityResult.none) {
                                            await Alert(
                                              context: context,
                                              type: AlertType.info,
                                              title: "no internet",
                                              desc: "",
                                              buttons: [
                                                DialogButton(
                                                  child: Text(
                                                    "OK",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20),
                                                  ),
                                                  onPressed: () =>
                                                      Navigator.pop(context),
                                                  width: 120,
                                                )
                                              ],
                                            ).show();
                                          } else if (connectivityResult ==
                                              ConnectivityResult.mobile ||
                                              connectivityResult ==
                                                  ConnectivityResult.wifi) {
                                            final status = await Permission
                                                .storage
                                                .request();
                                            if (status.isGranted) {
                                              final externalDir =
                                              await getExternalStorageDirectory();

                                              final id = await FlutterDownloader
                                                  .enqueue(
                                                url: mydata[index]
                                                ['downloadURL'],
                                                savedDir: externalDir.path,
                                                fileName:
                                                "${mydata[index]['filename']}",
                                                showNotification: true,
                                                openFileFromNotification: true,
                                              );

                                              await Alert(
                                                context: context,
                                                type: AlertType.success,
                                                title: "Downloading",
                                                desc: "",
                                                buttons: [
                                                  DialogButton(
                                                    child: Text(
                                                      "OK",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 20),
                                                    ),
                                                    onPressed: () =>
                                                        Navigator.pop(context),
                                                    width: 120,
                                                  )
                                                ],
                                              ).show();
                                            } else {
                                              print("Permission deined");
                                            }
                                          }
                                        },
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
                                                  'images/pdf_download.png',
                                                  width: 60.0,
                                                  height: 60.0,
                                                ),
                                              ),
                                              Expanded(
                                                  flex: 3,
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsets.all(
                                                        8.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .center,
                                                      children: [
                                                        Text(
                                                            '${mydata[index]['filename']}')
                                                      ],
                                                    ),
                                                  ))
                                            ],
                                          ),
                                        ),
                                      ),
                                    )))
                          ]),
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
        ));
  }
}
