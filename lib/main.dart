import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Postman Loading Animation🤩'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE8DFCA),
      appBar: AppBar(
        backgroundColor: Color(0xFFF65000),
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(alignment: Alignment.center, children: [
              Container(
                  height: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xFFF65000))),
              RollingCircle(
                height: 80,
              ),
              RollingCircle(
                  height: 110,
                  duration: 2100
              ),
              RollingCircle(
                  height: 140,
                  duration: 4000
              ),
            ]),
          ],
        ),
      ),
    );
  }
}

class RollingCircle extends StatefulWidget {
  final double height;
  final int duration;

  const RollingCircle({Key key, this.height, this.duration = 1100}) : super(key: key);
  @override
  _RollingCircleState createState() => _RollingCircleState();
}

class _RollingCircleState extends State<RollingCircle>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: widget.duration),
      vsync: this,
    )..repeat();
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
        turns: _animation,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: widget.height,
              width: widget.height,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Color(0xFFF65000), width: 1),
              ),
            ),
            Positioned(
              top: -4,
              left: 0,
              right: 0,
              child: Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFF65000),
                ),
              ),
            ),
          ],
        )
    );
  }
}