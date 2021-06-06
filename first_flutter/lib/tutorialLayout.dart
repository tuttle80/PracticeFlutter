
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



class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {

  bool _isFavorited = true;
  int _count = 41;

  void _toggleFavorite() {
    setState(() {
      _isFavorited = !_isFavorited;
      _count += (_isFavorited) ? 1 : -1;
    });
    
  }

  @override
  Widget build(BuildContext context) {
    //return Icon(Icons.star);
    return Row (
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(20),
          child: IconButton(
            icon: _isFavorited ? Icon(Icons.star) : Icon(Icons.star_outline),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 18,
          child: Container(
            child: Text("$_count"),
          ),
        ),
      ],
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
        FavoriteWidget(),
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
      body: ListView (
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

          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child : TapboxA(),
          ),
        ],
      ),

    );

  }


}

// ----------------------------------------------------------
class TapboxA extends StatefulWidget {
  @override
  _TapboxAState createState() => _TapboxAState();
}

class _TapboxAState extends State<TapboxA> {
  bool _isActive = false;

  void _handleTap() {
    setState(() {
      _isActive = !_isActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Center(
          child: Text(
            _isActive ? "Active" : "Inactive",
            style: TextStyle(
              fontSize: 32.0,
              color: Colors.white,
            ),
          ),
        ),
        width: 200.0,
        height: 100.0,
        decoration: BoxDecoration(
          color: _isActive ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}
