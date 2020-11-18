import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newvote/workers/databrain.dart';
import 'package:newvote/themes/theme.dart';

// ignore: must_be_immutable
class ContentListViewOne extends StatelessWidget {
  final Data data;
  ContentListViewOne({
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
          height: double.infinity,
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
              မြန်မာနိုင်ငံသည် ဒီမိုကရေစီစနစ် အသွင်ကူးပြောင်းရေး လုပ်ငန်းစဉ်ကို လက်ရှိပြဋ္ဌာန်း အတည်ပြုထားသော ၂၀၀၈ ခုနှစ် ဖွဲ့စည်းပုံအခြေခံဥပဒေအရ ဆောင်ရွက်နေပါသည်။ ဒီမိုကရေစီစနစ်၏ အဓိက အစိတ်အပိုင်း တစ်ခုဖြစ်သော ရွေးကောက်ပွဲများကိုလည်း ၂၀၁၀ ခုနှစ်မှ စတင်၍  ကျင်းပခဲ့ပါသည်။ ဒီမိုကရေစီစနစ်သည် ပြည်သူများမှ လွတ်လပ်စွာ ရွေးချယ်သော ပြည်သူ့ကိုယ်စားလှယ်များနှင့် နိုင်ငံတော်ကို စီမံခန့်ခွဲအုပ်ချုပ်သော စနစ်ဖြစ်သည့် အားလျော်စွာ ပြည်သူ့ကိုယ်စားလှယ်များကို ရွေးချယ်သည့် ရွေးကောက်ပွဲများသည် နိုင်ငံတော် အတွက် အလွန်အရေးကြီးသော လုပ်ငန်းစဉ်ဖြစ်ပြီး ပြည်သူအားလုံး အနေဖြင့်လည်း လွတ်လပ်တက်ကြွစွာ ပါဝင်ရန် လိုအပ်ပါသည်။
	          မြန်မာနိုင်ငံတွင် ပြဋ္ဌာန်းအတည်ပြုထားသော ရွေးကောက်ပွဲဥပဒေများအရ မဲဆန္ဒရှင်များသည် မဖြစ်မနေ မဲပေးရန် မလိုအပ်ပဲ မိမိဆန္ဒအတိုင်းမဲပေးခြင်း၊ မဲမပေးခြင်းကို ဆောင်ရွက်နိုင်ပါသည်။
	          ပြည်သူများအနေဖြင့် ကိုယ်စားလှယ်လောင်းများအဖြစ် ဝင်ရောက်အရွေးချယ်ခံခြင်း၊ ဆန္ဒပြု၍ ရွေးချယ် ပေးခြင်း လုပ်ငန်းစဉ်တွက် တက်ကြွစွာ ပူးပေါင်းပါဝင်မှသာ ခိုင်မာသော ဒီမိုကရေစီစနစ် တစ်ရပ် ကို  ထူထောင်နိုင်မည် ဖြစ်ပါသည်။ ထို့အပြင် ဆန္ဒမဲပေးခြင်း လုပ်ငန်းစဉ်တွင်လည်း မှန်ကန်စွာ ဆောင်ရွက် နိုင်မှသာ မိမိတို့၏ လွတ်လပ်စွာ ဆန္ဒပြုနိုင်မှု မဆုံးရှုံးမည် ဖြစ်ပါသည်။ 
	          ဒီမိုကရေစီ ရွေးကောက်ပွဲများတွင် မဲဆန္ဒရှင်ပြည်သူများအနေဖြင့် လွတ်လပ်တက်ကြွစွာ ပူးပေါင်း ဆောင်ရွက်လာစေရန် ရည်ရွယ်ပြီး ဒီမိုကရက်တစ်နိုင်ငံသား တစ်ဦးအနေဖြင့် အခြေခံ သိသင့်သိထိုက်သော သဘောတရားများနှင့် ရွေးကောက်ပွဲဆိုင်ရာ အသိအမြင်များ ပိုမိုသိရှိနားလည်စေရန် ရည်ရွယ်၍ ဤ အသိ ပညာပေး Mobile Application ကို ဖန်တီးဖြန့်ဝေရခြင်း ဖြစ်ပါသည်။ 
              """)
            ],
          ),
        ));
  }
}
