import 'package:flutter/material.dart';

class DetailWidget extends StatefulWidget {
  final data;
  final ValueChanged onItemSelected;

  DetailWidget(this.data, this.onItemSelected);

  @override
  _DetailWidgetState createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget> {
  var county;
  @override
  Widget build(BuildContext context) {
    // print(widget.data.length);
    return Container(
      color: Colors.blue,
      child: Container(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
              child: ListView.builder(
                itemCount: widget.data.length,
                itemBuilder: (BuildContext context, int index) {
                  county = widget.data[index]["qty"] ;
                  return Column(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(widget.data[index]["url"],
                          style: TextStyle(
                              color: Colors.white, fontSize: 18, height: 1.5)),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(
                                  Icons.close,
                                  color: Colors.white,
                                  size: 25,
                                  ),
                                  onPressed: (){
                                    // widget.data.remove(widget.data[index]);
                                    widget.onItemSelected(widget.data[index]);
                                    // setState(() {});
                                  },
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "REMOVE",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(
                                    Icons.remove_circle_outline,
                                    color: Colors.white,
                                    size: 35,
                                  ),
                                  onPressed: () {
                                    if (county > 1) {
                                      widget.data[index]['qty'] = widget.data[index]['qty'] - 1;
                                    }
                                    else{
                                      widget.data.remove(widget.data[index]);
                                    }
                                    setState(() {});
                                  },
                                ),
                                SizedBox(width: 10),
                                Text(widget.data[index]["qty"].toString(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18)),
                                SizedBox(width: 10),
                                IconButton(
                                  icon: Icon(
                                    Icons.add_circle_outline,
                                    color: Colors.white,
                                    size: 35,
                                  ),
                                  onPressed: () {
                                    widget.data[index]['qty'] = widget.data[index]['qty'] + 1;
                                    setState(() {});
                                  },
                                ),
                              ],
                            ),
                          )
                        ]),
                    Divider()
                  ]);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xffe3f2fd)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Total", style: TextStyle(fontSize: 18),),
                        Text("20000", style: TextStyle(fontSize: 18))
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Total", style: TextStyle(fontSize: 18),),
                        Text("20000", style: TextStyle(fontSize: 18))
                      ],
                    ),
                    
                  ]
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8.0),
              child: FlatButton(
                color: Color(0xffe3f2fd),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Checkout", style: TextStyle(color: Colors.blue, fontSize: 20),),
                ), 
                onPressed: () {},
              ),
            )
            // Padding(
            //   padding: const EdgeInsets.all(16.0),
            //   child: Text(widget.data.toString(), style: TextStyle(fontSize: 18.0, color: Colors.white),),
            // ),
          ],
        ),
      ),
    );
  }
}
