import 'package:flutter/material.dart';

//USER INFO
int userId;
List<String> months = ['','January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
List<String> nameOfDay = ['','Monday', 'Tuesday', 'Wednesday','Thursday','Friday','Saturday','Sunday'];
double sizeHorizontal;
double sizeVertical;
Widget chatIconTheme;

class SizeConfig {
  static MediaQueryData  _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double blockSizeHorizontal;
  static double blockSizeVertical;

  static double _safeAreaHorizontal;
  static double _safeAreaVertical;
  static double safeBlockHorizontal;
  static double safeBlockVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    _safeAreaHorizontal = _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical = _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;
    sizeHorizontal = safeBlockHorizontal;
    sizeVertical = safeBlockVertical;
//    chatIconTheme = Container(child: SvgPicture.asset('res/graphics/chat00.svg',color: Colors.white,),height: 50,width: 50,);


  }
}

//------------------------------------------TEXTSTYLE
TextStyle h0(Color color) => TextStyle(
    fontSize: sizeHorizontal * 10,
    fontWeight: FontWeight.bold,
    color: color,
    fontFamily: 'SFProBold'
);

TextStyle h1(Color color) => TextStyle(
    fontSize: sizeHorizontal * 8.5,
    fontWeight: FontWeight.bold,
    color: color,
    fontFamily: 'SFProBold'
);

TextStyle h2 (Color color) => TextStyle(
    fontSize: sizeHorizontal * 7,
    fontWeight: FontWeight.bold,
    color: color,
    fontFamily: 'SFProBold'

);

TextStyle h3 (Color color) => TextStyle(
    fontSize: sizeHorizontal * 6,
    fontWeight: FontWeight.bold,
    fontFamily: 'SFProBold',
    color: color

);

TextStyle h4 (Color color) => TextStyle(
    fontSize: sizeHorizontal * 5,
    fontWeight: FontWeight.bold,
    fontFamily: 'SFProBold',
    color: color
);

TextStyle h5 (Color color) => TextStyle(
    fontSize: sizeHorizontal * 4,
    fontWeight: FontWeight.bold,
    fontFamily: 'SFProBold',
    color: color
);

TextStyle h6 (Color color) => TextStyle(
    fontSize: sizeHorizontal * 3,
    fontWeight: FontWeight.bold,
    fontFamily: 'SFProBold',
    color: color
);

TextStyle h7 (Color color) => TextStyle(
    fontSize: sizeHorizontal * 2.5,
    fontWeight: FontWeight.bold,
    fontFamily: 'SFProBold',
    color: color
);

TextStyle t1 (Color color) => TextStyle(
    fontSize: sizeHorizontal * 5,
    color: color

);

TextStyle t2 (Color color) => TextStyle(
    fontSize: sizeHorizontal * 4,
    color: color
);

TextStyle t3 (Color color) => TextStyle(
    fontSize: sizeHorizontal * 3,
    color: color
);

TextStyle t4 (Color color) => TextStyle(
    fontSize: sizeHorizontal * 2.5,
    color: color
);

TextStyle t3U (Color color) => TextStyle(
    fontSize: sizeHorizontal * 3,
    color: color,
    decoration: TextDecoration.underline
);

TextStyle t5 (Color color) => TextStyle(
    fontSize: sizeHorizontal * 2,
    color: color
);

TextStyle ctaOrange = TextStyle(
    fontSize: sizeHorizontal * 4,
//    fontWeight: FontWeight.bold,
    color: Colors.white
);


//-----------------------color_section
const Color youngBlue = Color(0xFFB5E1F6);
const Color darkBlue = Color(0xFF04233C);
const Color blueFive = Color(0xFF058EC6);
const Color lightBlue = Color(0xFF85E0F4);
const Color darkGrey = Color(0xFF474747);
const Color greyTwo = Color(0xFF535353);
const Color successGreen = Color(0xFF8bc24a);
const Color dangerRed = Color(0xFFff4421);
const Color warningOrange = Color(0xffff9700);
const Color senjaBrown = Color(0xFFBE9B7B);
const Color senjaGreen = Color(0xFF02C39A);
const Color senjaRed = Color(0xFFD65A5A);
final Color greenTeal = new Color.fromRGBO(0, 222, 145, 1.0);

const Color eventBlack = Color(0xFF222224);
const Color eventGrey = Color(0xFF8E8E93);
const Color eventBlue = Color(0xFF007AFF);

const Color kursiKosong = Color(0xff02c39a);
const Color kursiTerisi = Color(0xffffffff);
const Color kursiPenuh = Color(0xffcccccc);
//-------------------------------------


//--------------------------------------------
void showInSnackBar(BuildContext context, GlobalKey<ScaffoldState> scaffoldKey,
    String value, int status) {
  Color color;
  if (status == 1) {
    color = successGreen;
  } else if (status == 2) {
    color = warningOrange;
  } else if (status == 3) {
    color = dangerRed;
  } else if (status == 4) {
    color = eventBlue;
  }
  FocusScope.of(context).requestFocus(FocusNode());
  scaffoldKey.currentState?.removeCurrentSnackBar();
  scaffoldKey.currentState.showSnackBar(SnackBar(
    content: Text(
      value,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Colors.white, fontSize: 16.0, fontFamily: "ZettaSans"),
    ),
    backgroundColor: color,
    duration: Duration(milliseconds: 2200),
  ));
}


// -------------------------------------------------------//

infoBox({String title, String subtitle}){
  return Container(
      padding: EdgeInsets.symmetric(horizontal: sizeHorizontal * 4, vertical: 10),
      margin: EdgeInsets.only(bottom: 10, top: 15,left: sizeHorizontal * 4, right: sizeHorizontal * 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white
      ),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Row(
              children: <Widget>[
                Icon(Icons.info_outline,color: eventGrey,),
                Text(
                  title
                  , style: h5(Colors.black),)
              ],
            ),
          ),
          Text(
            subtitle
            ,style: t3(Colors.black),
          ),
        ],
      )
  );
}

loadingContainer({double height, double width}){
  return Container(
    margin: EdgeInsets.only(top: 15),
    height: height,
    width: width,
    decoration:  BoxDecoration(
      color: eventGrey,
      borderRadius: BorderRadius.circular(10.0),
    ),
  );
}


String getDateAsString(String s){
  DateTime d = DateTime.parse(s);
  return nameOfDay[d.weekday]+', '+d.day.toString()+' '+months[d.month]+' '+d.year.toString();
}

String getMonthAndYear(String s){
  DateTime d = DateTime.parse(s);
  return months[d.month]+' '+d.year.toString();
}

String getDateDay(String s){
  DateTime d = DateTime.parse(s);
  return d.day.toString();
}

String getDateAsTimeClock(String s){
  DateTime d = DateTime.parse(s);
  return ((d.hour < 10)?'0'+d.hour.toString():d.hour.toString())+':'+((d.minute<10)?'0'+d.minute.toString():d.minute.toString());
}

showDialogLoadingTheme({BuildContext context}){
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context)=>Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ));
}

dividerGrey(){
  return Container(
    height: 7,
    color: Colors.grey[200],
  );
}

showDialogWarning({BuildContext context, String title, String description, String route}){
  return showDialog(
      context: context,
      builder: (context)=>Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
        ),
        elevation: 0,
//      backgroundColor: Colors.transparent,
        child: Container(
//        padding: EdgeInsets.all(20),
          margin: EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: const Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // To make the card compact
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: senjaBrown
                ),
                width: 50,
                height: 50,
                child:Icon(Icons.error_outline, color: senjaBrown,size: 50,),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  title,
                  style: h4(Colors.black),
                ),
              ),
              SizedBox(height: 16.0),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),

                child: Text(
                  description,
                  textAlign: TextAlign.center,
                  style: t2(Colors.grey),
                ),
              ),
              SizedBox(height: 25.0),
              Container(
                  margin: EdgeInsets.only(bottom: 15),
//            height: 200,
                  width: sizeHorizontal * 50,
//                margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      shape: BoxShape.rectangle,
                      color: senjaGreen
                  ),
                  child: FlatButton(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      onPressed: () async {
                        Navigator.pop(context);
                        if(route != null){
                          Navigator.pushNamed(context, 'Login');
                        }
                      },
                      child: Text(
                        (route != null)?route:'OK',
                        style: h5(Colors.white),
                      )
                  )
              )
            ],
          ),
        ),
      )
  );
}