import 'dart:async';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:multi_circular_slider/multi_circular_slider.dart';


void main() {
  runApp(MaterialApp(home: Scaffold(body: SamplePage())));
}

class SamplePage extends StatefulWidget {

  @override

  _SamplePageState createState() => _SamplePageState();
}

class _SamplePageState extends State<SamplePage> {
  void _openPage(Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => page,
      ),
    );
  }
  double percent = 0.0;
  @override
  void initState() {
    Timer timer;
    timer = Timer.periodic(Duration(milliseconds:3),(_){
     /* print('Percent Update');
      print(percent);*/
      setState(() {
        percent+=1;
        if(percent >= 100){
          timer.cancel();
          // percent=0;
        }
      });
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double per = 69;
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Percent Indicators"),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularPercentIndicator(
                radius: 150.0,
                lineWidth: 16.0,
                animation: true,
                percent: per/100,
                center: new Text(per.toString() +"%",style: TextStyle(fontSize:20.0,fontWeight: FontWeight.w600,color: Colors.black),),
                footer: new Text(
                  "Percentage",
                  style:
                  new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: Colors.blueAccent
            ),
            SizedBox(height: 100,),
            LinearPercentIndicator(
              width: size.width * 0.9,
              //width: 300.0,
              lineHeight: 30.0,
              animation: true,
              percent: per/100,
              center: new Text(per.toString() +"%",style: TextStyle(fontSize:20.0,fontWeight: FontWeight.w600,color: Colors.black),),
              // backgroundColor: Colors.black26,
              //fillColor: Colors.amber,
              progressColor: Colors.blueAccent,
            ),
            SizedBox(height: 100,),
            // MultiCircularSlider(
            //   size: MediaQuery.of(context).size.width * 0.8,
            //   values: [0.2, 0.1, 0.35, 0.25],
            //   colors: [Color(0xFFFD1960), Color(0xFF29D3E8), Color(0xFF18C737), Color(0xFFFFCC05)],
            // ),
          ],
        ),
      ),
    );
  }
}
