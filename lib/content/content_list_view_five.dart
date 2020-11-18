import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newvote/workers/databrain.dart';
import 'package:newvote/themes/theme.dart';

// ignore: must_be_immutable
class ContentListViewFive extends StatelessWidget {
  final Data data;
  ContentListViewFive({
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
          actions: <Widget>[
            new IconButton(
              icon: Icon(
                Icons.content_copy,
                color: Colors.black,
              ),
              onPressed: _showSnackBar,
            )
          ],
        ),
        body: Container(
          color: Colors.white,
          child: ListView(
            padding: EdgeInsets.all(8.0),
            children: <Widget>[
              Text(
                data.title,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text("""
                • ဒီမိုကရေစီစနစ်တွင် နိုင်ငံရေးပါတီများ ဖွဲ့စည်းနိုင်ခွင့်ကို ဖွဲ့စည်းပုံအခြေခံဥပဒေတွင် သတ်မှတ် ပြဋ္ဌာန်း ပေးရမည်။ 
                • နိုင်ငံသားတိုင်းသည် ဖွဲ့စည်းပုံအခြေခံဥပဒေပါ သတ်မှတ်ပြဋ္ဌာန်းချက်များနှင့်အညီ နိုင်ငံရေးပါတီများကို လွတ်လပ်စွာ ဖွဲ့စည်းနိုင်ခွင့်ရှိသည်။
                • နိုင်ငံသားများသည် နိုင်ငံရေးပါတီများတွင် လွတ်လပ်စွာ ဝင်ရောက်ခွင့်၊ ပံ့ပိုးကူညီခွင့် ရှိရမည်။
                • နိုင်ငံရေးပါတီများအနေဖြင့်လည်း ၎င်းတို့၏ မူဝါဒများ ချပြဆွေးနွေးခြင်းနှင့် စည်းရုံးခြင်းများကို လွတ်လပ်စွာ ဆောင်ရွက် ခွင့် ရှိရမည်။
              """),
              Text(
                "နိုင်ငံရေးပါတီများဖွဲ့စည်းမှုပုံစံများ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text("""
              နိုင်ငံရေးပါတီ ဖွဲ့စည်းခြင်းစနစ်များကို စံသတ်မှတ်ချက် အမျိုးမျိုးဖြင့် သရုပ်ခွဲ လေ့လာနိုင်ပါသည်။ အဓိက အသုံးပြုသည့် စံမှာအာဏာရရှိရေးအတွက် နိုင်ငံရေးစနစ်တစ်ခုတွင် ယှဉ်ပြိုင်နေသည့် ပါတီအရေအတွက် ပေါ် အခြေခံသည့် သီအိုရီဖြစ်သည်။ ထိုသီအိုရီအရ တစ်ပါတီစနစ် (One Party System)၊ နှစ်ပါတီစနစ် (Two Party System) နှင့် ပါတီစုံစနစ် (Multi Party System) ဟူ၍ သတ်မှတ်နိုင်ပါသည်။
          တစ်ပါတီစနစ်သည် နိုင်ငံရေးအာဏာကို တစ်ပါတီတည်းက လွှမ်းမိုးထားပြီး ပါတီများအကြား နိုင်ငံရေး ယှဉ်ပြိုင်မှု မရှိသော စနစ်ဖြစ်သည်။ 
          နှစ်ပါတီစနစ်သည် နိုင်ငံရေးအာဏာကို ပါတီကြီး (၂) ခုကသာ လွှမ်းမိုးချုပ်ကိုင်ထားပြီး အခြားပါတီငယ်များမှာ လက်အောက်ခံ ပါတီများကဲ့သို့ဖြစ်နေပြီး နိုင်ငံရေးအရ ယှဉ်ပြိုင်မှု အခွင့်အလမ်း နည်းပါးပါသည်။ 
          ပါတီစုံစနစ်တွင် ပါတီများမှာ နိုင်ငံရေးအာဏာကို တန်းတူယှဉ်ပြိုင်ခွင့် ရရှိပြီး နိုင်ငံရေးအာဏာရယူမှုတွင်လည်း ပါဝင်ဆောင်ရွက်နိုင်သည့် အခြေအနေတွင် ရှိပါသည်။ 
          နိုင်ငံရေးပါတီများကို သရုပ်ခွဲကြည့်ပါက 
          ၁။ ကွန်ဆာဗေးတစ်ပါတီများ (Conservative Parties)
          ၂။ လစ်ဘရယ်ပါတီများ (Liberal Parties)
          ၃။ ဆိုရှယ်ဒီမိုကရက်ပါတီများ (Social Democratic Parties)
          ၄။ ဆိုရှယ်လစ်ပါတီများ (Socialist Parties)
          ၅။ ဘာသာရေးအခြေပြုပါတီများ (Parties Defined by Religion)
          ၆။ လက်ယာစွန်းပါတီများ (Exterme Right – Wing Parties)
          ၇။ ကွန်မြူနစ်ပါတီများ (Communist Parties) ဟူ၍ တွေ့မြင်နိုင်ပါသည်။ 

""")
            ],
          ),
        ));
  }
}
