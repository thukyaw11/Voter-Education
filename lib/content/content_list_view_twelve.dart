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
class ContentListViewTwelve extends StatelessWidget {
  final Data data;
  ContentListViewTwelve({
    Key key,
    @required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();
    final copied = ClipboardData(text: "text");
    Clipboard.setData(copied);

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
            future:
                DefaultAssetBundle.of(context).loadString('load-json/uec.json'),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                var mydata = jsonDecode(snapshot.data.toString());
                return ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          ExpandablePanel(
                            header: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('${mydata[index]['title']}'),
                            ),

                            expanded: Column(
                              children: [
                                ..._getIngredients(
                                    mydata[index]['content'], context)
                              ],
                            ),
                            // expanded:
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
        ));
  }
}

List<Widget> _getIngredients(ingredients, context) {
  // type 'List<Widget>' is not a subtype of type 'Widget'
  return ingredients
      .map<Widget>(
        (i) => GestureDetector(
          child: Container(
            constraints: BoxConstraints(
              minHeight: 40,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 6,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("${i['contentTitle']}"),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: IconButton(
                    icon: Icon(Icons.file_download),
                    onPressed: () async {
                      var connectivityResult =
                          await (Connectivity().checkConnectivity());
                      if (connectivityResult == ConnectivityResult.none) {
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
                                    color: Colors.white, fontSize: 20),
                              ),
                              onPressed: () => Navigator.pop(context),
                              width: 120,
                            )
                          ],
                        ).show();
                      } else if (connectivityResult ==
                              ConnectivityResult.mobile ||
                          connectivityResult == ConnectivityResult.wifi) {
                        final status = await Permission.storage.request();
                        if (status.isGranted) {
                          final externalDir =
                              await getExternalStorageDirectory();

                          final id = await FlutterDownloader.enqueue(
                            url: i['contentURL'],
                            savedDir: externalDir.path,
                            fileName: "${i['contentTitle']}.pdf",
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
                                      color: Colors.white, fontSize: 20),
                                ),
                                onPressed: () => Navigator.pop(context),
                                width: 120,
                              )
                            ],
                          ).show();
                        } else {
                          print("Permission deined");
                        }
                      }
                    },
                  ),
                ),
              ],
            ),
            width: double.infinity,
            margin: EdgeInsets.all(8.0),
            padding: EdgeInsets.only(bottom: 10.0),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                    bottom: BorderSide(color: Colors.grey[300], width: 1.0))),
          ),
        ),
      )
      .toList();
}
