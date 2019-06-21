import 'package:flutter/material.dart';
import 'package:pos/DetailWidget.dart';
import 'package:pos/DetialPage.dart';
import 'package:pos/ListWidget.dart';

class MasterDetailPage extends StatefulWidget {
  @override
  _MasterDetailPageState createState() => _MasterDetailPageState();
}

class _MasterDetailPageState extends State<MasterDetailPage> {

  var data = [
    {
      "albumId": 1,
      "id": 1,
      "title": "accusamus beatae ad facilis cum similique qui sunt",
      "url": "https://via.placeholder.com/600/92c952",
      "thumbnailUrl": "https://via.placeholder.com/150/92c952"
    },
    {
      "albumId": 1,
      "id": 2,
      "title": "reprehenderit est deserunt velit ipsam",
      "url": "https://via.placeholder.com/600/771796",
      "thumbnailUrl": "https://via.placeholder.com/150/771796"
    },
    {
      "albumId": 1,
      "id": 3,
      "title": "officia porro iure quia iusto qui ipsa ut modi",
      "url": "https://via.placeholder.com/600/24f355",
      "thumbnailUrl": "https://via.placeholder.com/150/24f355"
    },
    {
      "albumId": 1,
      "id": 4,
      "title": "culpa odio esse rerum omnis laboriosam voluptate repudiandae",
      "url": "https://via.placeholder.com/600/d32776",
      "thumbnailUrl": "https://via.placeholder.com/150/d32776"
    },
    {
      "albumId": 1,
      "id": 5,
      "title": "natus nisi omnis corporis facere molestiae rerum in",
      "url": "https://via.placeholder.com/600/f66b97",
      "thumbnailUrl": "https://via.placeholder.com/150/f66b97"
    }
  ];
  List selectedValue = [];
  var isLargeScreen = false;

   bool updateSelectedValue(Map itemId) {

    //  itemId.putIfAbsent('qty', ()=> 0);
    //  selectedValue.add(itemId);

     selectedValue.map((item) {
        if(item['id'] == itemId["id"]){
          item['qty'] = item['qty']+ 1; 
        }
     }).toList();
    //  selectedValue.asMap().forEach((index, value){
    //    if (selectedValue[index]['id'] == itemId){
    //       selectedValue[index]['qty'] = 1;
    //    }
    //  });
      return false;
    }

    bool removed(Map itemId) {

    //  itemId.putIfAbsent('qty', ()=> 0);
    //  selectedValue.add(itemId);

     selectedValue.map((item) {
        if(item['id'] == itemId["id"]){
          item['qty'] = 1; 
        }
     }).toList();
    //  selectedValue.asMap().forEach((index, value){
    //    if (selectedValue[index]['id'] == itemId){
    //       selectedValue[index]['qty'] = 1;
    //    }
    //  });
      return false;
    }

  bool checkItem(int itemId) {
  for (var e in selectedValue) {
    if (e['id'] == itemId) return true;
  }
  return false;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: Icon(Icons.menu),
      appBar: AppBar(
        title: Text("POS"),
      ),
      body: OrientationBuilder(builder: (context, orientation) {

        if (MediaQuery.of(context).size.width > 600) {
          isLargeScreen = true;
        } else {
          isLargeScreen = false;
        }

        return Row(children: <Widget>[
          Expanded(
            flex: 2,
            child: ListWidget(data, 
            (value) {
              // print(value);
              // print(selectedValue);
              if (isLargeScreen) {

                // selectedValue.add(value);
                if(checkItem(value['id'])){
                  updateSelectedValue(value);
                }else{
                  value.putIfAbsent('qty', ()=> 1);
                  selectedValue.add(value);
                }
                 setState(() {});
              } else {
                Container();
                // Navigator.push(context, MaterialPageRoute(
                //   builder: (context) {
                //     return DetailPage(value);
                //   },
                // ));
              }
            }),
          ),
          isLargeScreen ? Expanded(flex: 1, child: DetailWidget(selectedValue, (item){
            if(checkItem(item['id'])){
              removed(item);
              selectedValue.remove(item);
              print("remove");
            }
            else{

            }

            // selectedValue.remove(item);
            setState(() {});
          })) : Container(),
        ]);
      }),
    );
  }
}