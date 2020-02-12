import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Lato'),
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  int opacity = 0;

  var tween = Tween(begin: Offset(2, 0), end: Offset.zero)
      .chain(CurveTween(curve: Curves.bounceInOut));
  AnimationController animationController;

  bool forMin = false;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    super.initState();
  }

  var offstage = false;


  Color color = Colors.white;
  String image = "";
  String title = "";
  String other = "";

  onTap() {
    setState(() {
      offstage = !offstage;
      animationController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: color,
        child: Column(
          children: <Widget>[
            Offstage(
              offstage: offstage,
              child: Container(
                margin: EdgeInsets.only(top: 60, bottom: 20),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                              child: Text(
                                "Movies Now",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              margin: EdgeInsets.only(left: 25),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Text("Bangalore"),
                                  Icon(
                                    Icons.arrow_drop_down,
                                    size: 20,
                                    color: Colors.black,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Padding(
                              child: Icon(
                                Icons.cast,
                                color: Colors.black,
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 10),
                            ),
                            Padding(
                              child: Icon(
                                Icons.search,
                                color: Colors.black,
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 10),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Offstage(
              offstage: !offstage,
              child: ScaleTransition(
                scale: AnimationController(
                    vsync: this, duration: Duration(milliseconds: 1000))
                  ..drive(Tween(begin: 0, end: 2))
                  ..forward(),
                child: Container(
                  color: color,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        child: Image.asset(
                          image,
                          height: 450,
                        ),
                        margin: EdgeInsets.only(top: 90),
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            title,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          ),
                          Text(
                            other,
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      SizedBox(height: 10,),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        child: Text("PLAY", style: TextStyle(color: Colors.white),),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: Colors.white, width: 2)),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Offstage(
                offstage: offstage,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: CustomScrollView(
                        slivers: <Widget>[
                          SliverStaggeredGrid.count(
                            mainAxisSpacing: 0,
                            crossAxisSpacing: 0,
                            crossAxisCount: 2,
                            children: <Widget>[
                              MyCard(
                                title: "Frozen",
                                color: Colors.cyan[700],
                                imageDirectory: "images/frozen.png",
                                imagePosition: Position.left,
                                textPosition: Position.top,
                                otherText: "2019 - Drama/Fantasy",
                                onTap: (){
                                  onTap();
                                  setState(() {
                                    image = "images/frozen.png";
                                    title = "Frozen";
                                    color = Colors.cyan[700];
                                    other = "2019 - Drama/Fantasy";
                                  });
                                },
                              ),
                              MyCard(
                                title: "Sonic",
                                color: Colors.blue[700],
                                imageDirectory: "images/sonic.png",
                                imagePosition: Position.right,
                                textPosition: Position.bottom,
                                otherText: "2020 - Fantasy",
                                onTap: (){
                                  onTap();
                                  setState(() {
                                    image = "images/sonic.png";
                                    title = "Sonic";
                                    color = Colors.blue[700];
                                    other = "2020 - Fantasy";
                                  });
                                },
                              ),
                              MyCard(
                                title: "Boss Baby",
                                color: Colors.blueGrey[700],
                                imageDirectory: "images/bossbaby.png",
                                imagePosition: Position.right,
                                textPosition: Position.bottom,
                                otherText: "2020 - Fantasy/Adventure",
                                onTap: (){
                                  onTap();
                                  setState(() {
                                    image = "images/bossbaby.png";
                                    title = "Boss Baby";
                                    color = Colors.blueGrey[700];
                                    other = "2020 - Fantasy/Adventure";
                                  });
                                },
                              ),
                              MyCard(
                                title: "Croods",
                                color: Colors.brown[400],
                                imageDirectory: "images/crood.png",
                                imagePosition: Position.right,
                                textPosition: Position.bottom,
                                otherText: "2020 - Fantasy/Adventure",
                                onTap: (){
                                  onTap();
                                  setState(() {
                                    image = "images/crood.png";
                                    title = "Croods";
                                    color = Colors.brown[400];
                                    other = "2020 - Fantasy/Adventure";
                                  });
                                },
                              ),
                              MyCard(
                                title: "Minions",
                                color: Colors.yellow[800],
                                imageDirectory: "images/minion.png",
                                imagePosition: Position.right,
                                textPosition: Position.top,
                                otherText: "2020 - Fantasy/Adventure",
                                onTap: () {
                                  onTap();
                                  setState(() {
                                    image = "images/minion.png";
                                    title = "Minions";
                                    color = Colors.yellow[800];
                                    other = "2020 - Fantasy/Adventure";
                                  });                                },
                              ),
                              MyCard(
                                title: "Lion King",
                                color: Colors.brown[800],
                                imageDirectory: "images/lionking.png",
                                imagePosition: Position.left,
                                textPosition: Position.bottom,
                                otherText: "2020 - Fantasy/Adventure",
                                onTap: (){
                                  onTap();
                                  setState(() {
                                    image = "images/lionking.png";
                                    title = "Lion King";
                                    color = Colors.brown[800];
                                    other = "2020 - Fantasy/Adventure";
                                  });
                                },
                              )
                            ],
                            staggeredTiles: [
                              StaggeredTile.count(1, 1.85),
                              StaggeredTile.count(1, 1.6),
                              StaggeredTile.count(1, 1.8),
                              StaggeredTile.count(1, 1.8),
                              StaggeredTile.count(1, 1.3),
                              StaggeredTile.count(1, 1.35)
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

enum Position { left, right, top, bottom }

class MyCard extends StatelessWidget {
  final String title;
  final String imageDirectory;
  final Color color;
  final Position imagePosition;
  final Position textPosition;
  final String otherText;
  final Function onTap;

  const MyCard(
      {Key key,
      this.title,
      this.imageDirectory,
      this.color,
      this.imagePosition,
      this.textPosition,
      this.otherText,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(4),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 10,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Offstage(
                    offstage: textPosition == Position.bottom,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          child: Align(
                            child: Text(title,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            alignment: Alignment.centerLeft,
                          ),
                          padding:
                              EdgeInsets.only(left: 10, right: 10, top: 10),
                        ),
                        Padding(
                          child: Align(
                            child: Text(otherText,
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.white,
                                )),
                            alignment: Alignment.centerLeft,
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 10),
                        ),
                      ],
                    ),
                  ),
                  FractionalTranslation(
                      translation: imagePosition == Position.left
                          ? Offset(-0.35, 0)
                          : Offset(0.35, 0),
                      child: Image.asset(
                        imageDirectory,
                        width: 140,
                        fit: BoxFit.fill,
                        scale: 1,
                      )),
                  Offstage(
                    offstage: textPosition == Position.top,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          child: Align(
                            child: Text(title,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            alignment: Alignment.centerLeft,
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 10),
                        ),
                        Padding(
                          child: Align(
                            child: Text(otherText,
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.white,
                                )),
                            alignment: Alignment.centerLeft,
                          ),
                          padding:
                              EdgeInsets.only(left: 10, right: 10, bottom: 10),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(20)),
          ),
        ),
      ),
    );
  }
}
