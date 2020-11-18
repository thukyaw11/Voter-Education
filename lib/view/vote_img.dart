import 'package:flutter/material.dart';
import '../workers/vote_image_worker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:newvote/themes/theme.dart';
import '../workers/store_image.dart';

class VoteImageListing extends StatelessWidget {
  final VoteImageWorker data;

  VoteImageListing({
    Key key,
    @required this.data,
    voteImageList,
    title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        elevation: 0,
        titleSpacing: 0.0,
        backgroundColor: AppTheme.lightTheme.primaryColor,
        title: Text(
          data.title,
          style: TextStyle(fontSize: 19, color: Colors.black),
        ),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: data.voteImageList.length,
          itemBuilder: (context, position) {
            return Container(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  child: FlatButton(
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        '/fullscreen',
                        arguments: ImageStore(
                            '${data.voteImageList[position]['imageURL']}'),
                      );
                    },
                    child: Image(
                      image: AssetImage(
                          '${data.voteImageList[position]['imageURL']}'),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
