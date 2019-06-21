import "package:flutter/material.dart";

class HeroExamplePage extends StatefulWidget {
  final id;
  HeroExamplePage(this.id);

  @override
  _HeroExamplePageState createState() => _HeroExamplePageState();
}

class _HeroExamplePageState extends State<HeroExamplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Selected image'),
      ),
      body: Center(
        child: Hero(
            tag: widget.id,
            child: FlutterLogo(
              size: 200.0,
            )
        ),
      ),
    );
  }
}