import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pos/HeroExamplePage.dart';

typedef Null ItemSelectedCallback(int value);

class ListWidget extends StatefulWidget {
  final List count;
  final ValueChanged onItemSelected;

  ListWidget(
    this.count,
    this.onItemSelected,
  );

  @override
  _ListWidgetState createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  String _categories;

  var categories = <String>[
    'Shirts',
    'Shoes',
    "Hairs"
  ];
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: <Widget>[
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                      decoration: BoxDecoration(
          border: Border.all(width: 0.4),
          borderRadius: BorderRadius.circular(5)),
                child: DropdownButtonHideUnderline(
          child: Container(
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 10),
        child: DropdownButton(
          isExpanded: true,
          hint: Text(
                'Categories?',
                textAlign: TextAlign.left,
          ),
          value: _categories == null ? null : _categories,
          items: categories.map((String value) {
                return new DropdownMenuItem<String>(
                  value: value,
                  child: new Text(value),
                );
          }).toList(),
          onChanged: (value) {
                setState(() {
                  _categories = value;
                });
          },
        ),
      )),
              ),
            )
          ),
          Flexible(
            flex: 2,
                      child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (text) {
                  // _debouncer.run(() => search(text));
                },
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 17, horizontal: 10),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(width: 1),
                        borderRadius: BorderRadius.circular(5)),
                    disabledBorder: InputBorder.none,
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1),
                        borderRadius: BorderRadius.circular(5)),
                    focusedErrorBorder:
                        OutlineInputBorder(borderSide: BorderSide(width: 0)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(width: 1)),
                    filled: true,
                    labelStyle: TextStyle(fontFamily: 'IBM'),
                    fillColor: Colors.white,
                    hintText: 'Search Products...',
                    prefixIcon: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        print('d');
                      },
                    ),
                    hintStyle: TextStyle(fontFamily: 'IBM'),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(style: BorderStyle.solid, width: 0.4),
                        borderRadius: BorderRadius.circular(5))),
                // controller: _controller,
                keyboardType: TextInputType.text,
              ),
            ),
          ),
        ],
      ),
      Flexible(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1,
          ),
          itemBuilder: (BuildContext context, int position) {
            // return _getGridItemUI(data[index]);
            // print(widget.count[position]["url"]);

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: InkWell(
                  onTap: () {
                    widget.onItemSelected(widget.count[position]);
                    // widget.count[position];
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => HeroExamplePage(widget.count[position]["id"])));
                  },
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Hero(
                                                  child: Image(
                            image: new CachedNetworkImageProvider(
                                widget.count[position]["thumbnailUrl"]),
                          ), tag: widget.count[position]["id"],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          itemCount: widget.count.length,
        ),
        //   child: ListView.builder(
        //   itemCount: widget.count.length,
        //   itemBuilder: (context, position) {
        //     return Padding(
        //       padding: const EdgeInsets.all(8.0),
        //       child: Card(
        //         child: InkWell(
        //           onTap: () {
        //             widget.onItemSelected(position);
        //           },
        //           child: Row(
        //             children: <Widget>[
        //               Padding(
        //                 padding: const EdgeInsets.all(16.0),
        //                 child: Image(
        //                   image: new CachedNetworkImageProvider(widget.count[position]["thumbnailUrl"]),
        //                 ),
        //                 // child: Text(
        //                 //   widget.count[position]["thumbnailUrl"],
        //                 //   style: TextStyle(fontSize: 22.0),
        //                 // ),
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
        //     );
        //   },
        // )
      ),
    ]);
  }
}
