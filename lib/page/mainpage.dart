import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:google_login/provider/google_sign_in.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("HDB App")),
        body: Center(
            child: Column(
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      final provider =
                      Provider.of<GoogleSignInProvider>(context, listen: false);
                      provider.logout();
                    },
                    child: Container(
                      alignment: Alignment.topRight,
                          child: Text('Logout')
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                    },
                    child: Text('Search',
                      style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30)),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoanCalPage(),
                        ),
                      );
                    },
                    child: Text("Loan Calculator",
                        style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30)),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: CircleBorder(), primary: Colors.black),
                      child: Container(
                        width: 30,
                        height: 30,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(shape: BoxShape.circle),
                        child:Icon(Icons.info_outline),
                      ),

                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HelpPage(),
                          ),
                        );
                      }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const <Widget>[
                      Icon(
                        Icons.bookmark,
                        color: Colors.black,
                        size: 24.0,
                        semanticLabel: 'Text to announce in accessibility modes',
                      ),
                      FlatButton(
                        onPressed: null,
                        child: Text('Bookmarked Listings',
                            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30, color: Colors.black)),
                      ),
                    ],
                  ),
    Container(margin: EdgeInsets.symmetric(vertical: 20.0),
    height: 200.0,
    child: ListView(
    scrollDirection: Axis.horizontal,
      children: <Widget>[
    Container(
    width: 160.0,
    color: Colors.red,
    ),
    Container(
    width: 160.0,
    color: Colors.blue,
    ),
    Container(
    width: 160.0,
    color: Colors.green,
    ),
    Container(
    width: 160.0,
    color: Colors.yellow,
    ),
    Container(
    width: 160.0,
    color: Colors.orange,
    ),
    ],

    ),
    ),



                ]
            )

        ));
  }
}
class HelpPage extends StatelessWidget{
  HelpPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Help"),
        ),
        body: Center(
            child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    HelpPageView(),
                  ],
                ))));
  }
}
class HelpPageView extends StatefulWidget {
  @override
  HelpPageState createState() => HelpPageState();
}
class HelpPageState extends State<HelpPageView>{

  Widget build(BuildContext context){
    return Column(
      children: <Widget>[
        Image.asset('assets/images/HDB Image.png'),
        SizedBox(height: 10,),
        Container(
          alignment: Alignment.topLeft,
          margin: const EdgeInsets.only(left: 15.0),
          child: Text("About the application:",
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
            textAlign: TextAlign.left,
          ),
        ),

        Container(
          alignment: Alignment.topLeft,
          margin: const EdgeInsets.all(15.0),
          padding: const EdgeInsets.all(10.0),
          height: 120.0,
          decoration: BoxDecoration(
            color: CupertinoColors.lightBackgroundGray,
            border: null,
          ),
          child: Text("HDB App is a dual purpose mobile application which enables users to firstly, source for potential HDB listings based on your preferred filter criteria and secondly, calculate potential total and monthly loan / interest payments.",
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              letterSpacing: 0,
            ),
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          margin: const EdgeInsets.only(left: 15.0),
          child: Text("Frequently Asked Questions:",
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
            textAlign: TextAlign.left,
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          margin: const EdgeInsets.all(15.0),
          padding: const EdgeInsets.all(10.0),
          height: 270.0,
          decoration: BoxDecoration(
            color: CupertinoColors.lightBackgroundGray,
            border: null,
          ),
          child:Column(
            children:<Widget>[
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Text(""" 
1. Question: How is the total and monthly loan payment breakdown derived?

Answer: It is derived based on the HDB Loan Interest Rates. 

2. Question: I have no preferred criteria, is it possible to just view all available listings? 

Answer: Yes! Simply press the 'Search' button without adjusting any of the filters! 

3. Question: Can I see the nearby facilities of listing choice? 

Answer: Yes, you can do so in the Detailed Property View! Scroll down and you'll see a map  and scroll bar with colour coded nearby facilities.  Alternatively, you can click the View on Map icon and view the property on the actual Google Map. 

4. Question: How can I view a save a listing for easy viewing later on? 

Answer: You can bookmark the listing through the listing view, map view or the individual property view! These bookmarked listings will appear on your home screen. If you change your mind, simply click the bookmark button again to un-bookmark it

5.Question: I see a listing that I like, can I share it?

Answer: Yes of course! You can share the listing on Whatsapp, Messenger and Telegram through the share button located at the top right hand corner of the Property View!
              """,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      letterSpacing: 0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )],
    );
  }
}

class LoanCalPage extends StatelessWidget {
  LoanCalPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
            appBar: AppBar(
              title: Text("Loan Calculator"),
            ),
            body: Center(
                child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        _Slider(),
                      ],
                    )))));
  }
}

class _Slider extends StatefulWidget {
  @override
  _SliderState createState() => _SliderState();
}

class _SliderState extends State<_Slider> {
  static double _intValue = 0.0;
  static int _loanTenureValue = 1;
  static int _loanValue = 10;
  static String _principalValue = "500000";
  var myController = TextEditingController();

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            decoration: BoxDecoration(border: Border.all()),
            padding: EdgeInsets.all(15),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text("Property Value",
                      style:
                      TextStyle(fontWeight: FontWeight.w900, fontSize: 20)),
                  Container(
                    padding: EdgeInsets.all(15),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: myController,
                      decoration: new InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.blue, width: 2.0),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 0.0,
                          horizontal: 10.0,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.grey, width: 2.0),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () => myController.clear(),
                          icon: Icon(Icons.clear),
                        ),
                      ),
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Interest Rate (%)",
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 20),
                      ),
                      SizedBox(width: 150),
                      Text(
                        _intValue.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 20),
                      ),
                    ],
                  ),
                  Slider(
                    value: _intValue.toDouble(),
                    min: 0.0,
                    max: 4.0,
                    divisions: 40,
                    activeColor: Colors.blue,
                    inactiveColor: Colors.grey,
                    label: _intValue.toString(),
                    onChanged: (double newValue) {
                      setState(() {
                        _intValue = newValue;
                      });
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Loan Tenure (Years)",
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 20),
                      ),
                      SizedBox(width: 120),
                      Text(
                        _loanTenureValue.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 20),
                      ),
                    ],
                  ),
                  Slider(
                    value: _loanTenureValue.toDouble(),
                    min: 1,
                    max: 30,
                    divisions: 29,
                    activeColor: Colors.blue,
                    inactiveColor: Colors.grey,
                    label: _loanTenureValue.toString(),
                    onChanged: (double newValue) {
                      setState(() {
                        _loanTenureValue = newValue.round();
                      });
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Loan (%)",
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 20),
                      ),
                      SizedBox(width: 223),
                      Text(
                        _loanValue.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 20),
                      ),
                    ],
                  ),
                  Slider(
                    value: _loanValue.toDouble(),
                    min: 10,
                    max: 90,
                    divisions: 80,
                    activeColor: Colors.blue,
                    inactiveColor: Colors.grey,
                    label: _loanValue.toString(),
                    onChanged: (double newValue) {
                      setState(() {
                        _loanValue = newValue.round();
                      });
                    },
                  ),
                ])),
        SizedBox(height: 10),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: CircleBorder(), primary: Colors.blue),
                  child: Container(
                    width: 50,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: Icon(Icons.update),
                  ),
                  onPressed: () {
                    setState(
                          () {
                        _intValue = 0;
                        _loanTenureValue = 1;
                        _loanValue = 10;
                        myController.clear();
                      },
                    );
                  }),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: CircleBorder(), primary: Colors.blue),
                  child: Container(
                      width: 50,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      child: Text(
                        "GO",
                        style: TextStyle(fontSize: 16.0),
                      )),
                  onPressed: () {
                    setState(
                          () {
                        //enter change page here
                        _principalValue = myController.text;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoanVisualPage(
                                    intValue:_intValue,
                                    loanTenureValue:_loanTenureValue,
                                    loanValue:_loanValue,
                                    principalValue:checkNull(_principalValue)
                                )
                            )
                        );
                      },
                    );
                  }),
            ]),
      ],
    );

  }
  static double checkNull(String principalValue){
    try{return(double.parse(_principalValue));}
    catch(e){
      return 500000;}
  }
  static double getIntValue(){
    return _intValue;
  }
  static double getPrincipalValue(){
    return checkNull(_principalValue);
  }
  static int getLoanTenure(){
    return _loanTenureValue;
  }
  static int getLoan(){
    return _loanValue;
  }
}



class LoanVisualPage extends StatelessWidget{
  final  double intValue;
  final int loanTenureValue;
  final int loanValue;
  final double principalValue;


  LoanVisualPage({Key key, this.title, this.loanTenureValue,
    this.principalValue, this.loanValue, this.intValue}) : super(key: key);
  final String title;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
            appBar: AppBar(
              title: Text("Loan Visualisation Page"),
            ),
            body: Center(
                child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        _MonthlyVisualisation(),
                        SizedBox(height: 20,),//intValue:intValue,
                        _TotalVisualisation(),
                      ],
                    ))
            )));
  }
}

class LoanController{
  static double calculateTotalLoanAmount(double principalValue, int loanValue){
    return (loanValue/100)*principalValue;
  }
  static double calculateDownPayment(double principalValue, int loanValue ){
    return ((100-loanValue)/100)*principalValue;
  }

  static double calculateMonthlyPayment(double principalValue,double interestRate,int loanTenure,
      int loanValue){
    double totalLoanAmount = calculateTotalLoanAmount(principalValue, loanValue);
    return (totalLoanAmount*(interestRate))/(1-1/pow(1+interestRate,loanTenure))/12;
  }
  static double calculateMonthlyInterest(double principalValue, double interestRate, int loanValue){
    double totalLoanAmount = calculateTotalLoanAmount(principalValue, loanValue);
    return (totalLoanAmount*interestRate)/12;
  }
  static double calculateMonthlyLoanAmount(double principalValue, double interestRate,
      int loanTenure, int loanValue){
    return calculateMonthlyPayment(principalValue, interestRate, loanTenure,loanValue)-
        calculateMonthlyInterest(principalValue, interestRate,loanValue);
  }
}


class _MonthlyVisualisation extends StatefulWidget {
  final double intValue;
  final int loanTenureValue;
  final int loanValue;
  final double principalValue;

  _MonthlyVisualisation({Key key, this.intValue,this.loanTenureValue,
    this.principalValue, this.loanValue}) : super(key: key);
  @override
  _MonthlyVisualisationState createState() => _MonthlyVisualisationState();

}

class _MonthlyVisualisationState extends State<_MonthlyVisualisation> {

  //double interest=double.parse(intValue);
  Map<String, double> dataMap = {
    "Loan Amount ": LoanController.calculateMonthlyLoanAmount(
        _SliderState.getPrincipalValue(), _SliderState.getIntValue()/100,
        _SliderState.getLoanTenure(),_SliderState.getLoan()),
    "Interest ": LoanController.calculateMonthlyInterest(_SliderState.getPrincipalValue(), _SliderState.getIntValue()/100,_SliderState.getLoan())};

  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          Text('Monthly Payment Breakdown',style: TextStyle(fontWeight: FontWeight.w900, fontSize: 15),),
          Container(
            decoration: BoxDecoration(border: Border.all()),
            padding: EdgeInsets.all(20),
            child:
            Container(
                child: PieChart(
                    dataMap: dataMap,
                    chartType: ChartType.ring,
                    chartRadius: 130,
                    animationDuration: Duration(milliseconds: 500),
                    chartValuesOptions: ChartValuesOptions(
                      showChartValuesOutside: true,
                    ),
                    legendOptions: LegendOptions(
                      legendTextStyle: TextStyle(fontWeight: FontWeight.w900, fontSize: 12),
                    ),
                    centerText:'\$' + LoanController.calculateMonthlyPayment(_SliderState.getPrincipalValue(), _SliderState.getIntValue()/100,
                        _SliderState.getLoanTenure(), _SliderState.getLoan()).toStringAsFixed(2) + "\n/month"
                )
            ),

          ),
        ]
    );
  }
}


class _TotalVisualisation extends StatefulWidget {
  @override
  _TotalVisualisationState createState() => _TotalVisualisationState();
}

class _TotalVisualisationState extends State<_TotalVisualisation> {
  Map<String, double> dataMap = {
    "Loan Amount ": LoanController.calculateTotalLoanAmount(_SliderState.getPrincipalValue(), _SliderState.getLoan()),
    "Down Payment ": LoanController.calculateDownPayment(_SliderState.getPrincipalValue(), _SliderState.getLoan()),};

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('Total Payment Breakdown',style: TextStyle(fontWeight: FontWeight.w900, fontSize: 15),),
        Container(
            decoration: BoxDecoration(border: Border.all()),
            padding: EdgeInsets.all(20),
            child:
            Container(
                child: PieChart(
                    dataMap: dataMap,
                    chartType: ChartType.ring,
                    chartRadius: 130,
                    animationDuration: Duration(milliseconds: 500),
                    chartValuesOptions: ChartValuesOptions(
                      showChartValuesOutside: true,
                    ),
                    legendOptions: LegendOptions(
                      legendTextStyle: TextStyle(fontWeight: FontWeight.w900, fontSize: 12),
                    ),
                    centerText:'\$' +_SliderState.getPrincipalValue().toStringAsFixed(2)
                )
            )
        ),
      ],
    );

  }
}

