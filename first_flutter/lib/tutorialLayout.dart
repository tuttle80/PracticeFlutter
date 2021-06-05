
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(TutorialApp());
}

class TutorialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tutorial App",
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: TutorialAppPage2(),
    );
  }
}

class TutorialAppPage2 extends StatelessWidget {
  Widget selectionLayout = Container(
    margin: const EdgeInsets.all(20),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 8) ,
                child: Text(
                  "Osechinen Lake Campground. 2",
                  style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Text(
                  "Kandersteg, Switzerland"
              ),
            ],
          ),
        ),
        Icon(
          Icons.star,
          color: Colors.red,
        ),
        Text(
            "41"
        ),
      ],
    ),
  );





  @override
  Widget build(BuildContext context) {

    Color color = Theme.of(context).primaryColor;


    Column _customButtonColumn(Color color, IconData icon, String caption) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color,),
          Container(
            margin: const EdgeInsets.all(8),
            child: Text(
              caption,
              style: TextStyle(
                fontSize: 12,
                color: color,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      );
    }



    Widget selectButton = Container(
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _customButtonColumn(color, Icons.call, "CALL"),
          _customButtonColumn(color, Icons.near_me, "ROUTE"),
          _customButtonColumn(color, Icons.share, "SHARE"),
        ],
      ),
    );

    Widget textSelection = Container(
      padding: const EdgeInsets.all(20),
      child: Text('Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
          'Alps. Situated 1,578 meters above sea level, it is one of the '
          'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
          'half-hour walk through pastures and pine forest, leads you to the '
          'lake, which warms to 20 degrees Celsius in the summer. Activities '
          'enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true,

      ),
    );

    return Scaffold(
      //    appBar: AppBar(
      //    title: Text("Flutter layout demo"),
      //  ),

      // Body
      body: Column (
        children: [
          Image.asset(
            "images/lake.jpg",
            width: 600,
            height: 240,
            fit: BoxFit.cover,

          ),
          selectionLayout,
          selectButton,
          textSelection,
          Container(
            margin: const EdgeInsets.only(right: 15),
            alignment: Alignment.centerRight,
            child: Text("Done.",
              style: TextStyle(
                  color: Colors.red
              ),
              textAlign: TextAlign.end,
            ),
          ),

        ],
      ),

    );

  }
}