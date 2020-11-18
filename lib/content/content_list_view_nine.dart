import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newvote/workers/databrain.dart';
import 'package:newvote/themes/theme.dart';

// ignore: must_be_immutable
class ContentListViewNine extends StatelessWidget {
  final Data data;
  ContentListViewNine({
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
မိမိမဲတစ်ပြားသည်အလွန်အရေးပါသည်။
လျှို့ဝှက်မဲပေးခြင်းဖြစ်၍မည်သူ့ကိုမဲပေးခဲ့ကြောင်းကိုမည်သူမျှ မသိနိုင်ပါ။
လွတ်လပ်စွာမဲပေးနိုင်သည်။ 
မည်သူကမျှ ခြိမ်းခြောက်ခြင်း၊ အကြမ်းဖက်ခြင်း၊ လာဘ်ပေးလာဘ်ယူပြုလုပ်ခြင်း၊ မလျှော်သြဇာ သုံးခြင်း၊ လိမ်လည်ခြင်း၊ ဖြာယောင်းသွေးဆောင်ခြင်းမပြုနိုင်ပါ။ ပြုလုပ်လာလျှင် တိုင်ကြား နိုင်ပါသည်။
မည်သူအားမဲပေးခဲ့ကြောင်းကိုမည်သူကမျှ မေးမြန်းခွင့်မရှိပါ၊ မေးမြန်းလျှင်လည်း ပြောဆိုရန်တာဝန်မရှိပါ။ 
              """),
              Text(
                "ရွေးကောက်ပွဲပြစ်မှုများကို ကျူးလွန်မိခြင်းမရှိစေရန် မဲဆန္ဒရှင်များ လိုက်နာရမည့် အချက်များ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text("""
              
    • လာဘ်ပေးလာဘ်ယူမှုကိုရှောင်ရှားရန်၊ အကြမ်းဖက်ခြင်း၊ ခြိမ်းခြောက်ခြင်း၊ မလျော်သြဇာသုံးခြင်း၊ လိမ်လည် လှည့်ဖြားခြင်း မပြုရန်၊
    • ဆန္ဒမဲပေးခြင်း၊ရွေးကောက်ပွဲပျက်ပြားရန် လှုံ့ဆော်ခြင်း၊ ပြောဆိုခြင်းမပြုရန်၊
    • ကော်မရှင်မှ ထုတ်ပြန်ထားသောအကြောင်းကြားစာ၊ စာရွက်စာတမ်းများကိုဖျက်စီးခြင်းမပြုလုပ်ရန်၊
    • မိမိ၏ ဆန္ဒမဲလက်မှတ်ကိုအခြားသူတစ်ဦးအားပေးခြင်းမပြုရန်။
    • မိမိ၏ ဆန္ဒမဲလက်မှတ်ကိုမဲရုံအပြင်သို့  ယူဆောင်သွားခြင်းမပြုရန်။
    • မဲပုံးအတွင်းသို့ အခြားပစ္စည်းတစ်ခုခုကိုထည့်သွင်းခြင်းမပြုရန်။
    • မဲပုံးများကိုအခွင့်မရှိဘဲဖွင့်လှစ်ခြင်း၊ ဆန္ဒမဲလက်မှတ်များကိုဖျက်စီးခြင်းမပြုရန်။
    • ရွေးကောက်ပွဲတစ်ခုတွင် မဲဆန္ဒနယ်တစ်နယ်အတွက် တစ်ကြိမ်ထက်ပို၍ ဆန္ဒမဲမပေးရန်။
    • သူတစ်ပါးအယောင်ဆောင်၍ ဆန္ဒမဲမပေးရန်။
    • ကိုယ်စားပြု ဆန္ဒမဲမပေးရန်။
    • မဲရုံအတွင်းသို့ ဝင်ခွင့်မရှိဘဲ ဝင်ထွက်ခြင်းမပြုရန်။
    • အတုပြုလုပ်ထားသောမဲလက်မှတ်ကိုမဲပုံးထဲသို့ ထည့်သွင်းခြင်းမပြုရန်။
    • မဲပေးသူတစ်ဦးအားမဲမပေးရန်အတွက် နှောင့်ယှက်ခြင်မပြုရန်။
    • ရွေးကောက်ပွဲကျင်းပသည့်နေ့၌ မဲပေးသူများစိတ်ငြိုငြင်မှု သို့မဟုတ် မဲရုံတာဝန်ကျများ အနှောင့်အယှက် ဖြစ်စေမှု၊ မဖွယ်မရာသောအမှုများမပြုရန်။
    • မဲပေးနေချိန် မဲရုံအတွင်း၌ မဲရုံးမှူး၏ တာဝန်ဝတ္တရားအရ ဆောင်ရွက်မှုနှင့် စည်းကမ်းတစ်ကျ ညွှန်ကြားမှုတို့ကိုလိုက်နာရန်။
    • ငြိမ်ဝပ်ပိပြားရေးနှင့် ခိုက်ရန်ဖြစ်ပွားခြင်းမဖြစ်စေရန်အတွက် ကာကွယ်ထိန်းသိမ်းရန်။

              """)
            ],
          ),
        ));
  }
}
