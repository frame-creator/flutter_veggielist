import 'package:flutter/material.dart';
import 'package:my_veggielist_app/http/legacy_network.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.placeData}) : super(key: key);

  final dynamic placeData;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class Place {
  String title;
  String description;
  String image;

  Place(this.title, this.description, this.image);
}

class _MyHomePageState extends State<MyHomePage> {
  dynamic placeData;
  List data = [];
  @override
  void initState() {
    fetchData();
    super.initState();
  }

  void fetchData() async {
    //  var url = Uri.parse('url');
    NetWork network = NetWork();
    var placeData = await network.getJson();
    // print(placeData);
    List<dynamic> placeList = placeData['places'];
    for (int i = 0; i < placeList.length; i++) {
      var place = placeList[i];
      Place placeToAdd =
          Place(place['title'], place['description'], place['image']);
      //  print(placeToAdd.image);

      setState(() {
        data.add(placeToAdd);
      });
    }
  }

/*
  void fetchData() async {
    var url = Uri.parse('url');
    // Response response = await get(url);
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String jsonData = response.body;
      var parsingData = jsonDecode(jsonData)['places'];
      var myJson = parsingData[0]['title'];
      print(myJson);
      var title = parsingData[1];
      print(title);
    } else {
      print(response.statusCode);
    }
    // print(response.statusCode);
    // print(response.body);
  }
*/
  @override
  Widget build(BuildContext context) {
    /*   void updateData(dynamic data) {
      var description = data['description'];
      print(description);
    }
  
    @override
    void initState() {
      super.initState();
      //print(widget.placeData);
      updateData(widget.placeData);
      // print(widget.placeData);
    }
*/

    return Scaffold(
        body: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              Place place = data[index];
              return
                  //Text(place.description);
                  Padding(
                      padding: EdgeInsets.all(17.0),
                      child: InkWell(
                          onTap: () {},
                          child: Stack(children: <Widget>[
                            Container(
                              height: 270.0,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  image: DecorationImage(
                                      image: NetworkImage(place.image),
                                      //              //  '${recipepost['img_url']}'),
                                      fit: BoxFit.cover)),
                            ),
                            //make the shade a bit deeper.
                            Container(
                              height: 270.0,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Colors.black.withOpacity(0.3)),
                            ),
                            Positioned(
                              top: 10.0,
                              left: 10.0,
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    height: 50.0,
                                    width: 110.0,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        color: Colors.black.withOpacity(0.2)),
                                    child: Center(
                                        child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        // Icon(Icons.star, color: Colors.white, size: 12.0),
                                        // SizedBox(width: 5.0),

                                        Text(
                                          '자세히보기',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15.0,
                                          ),
                                        )
                                      ],
                                    )),
                                  ),
                                  //   SizedBox(width: 50.0),
                                  //   Text(
                                  //    'More',
                                  //    style: TextStyle(
                                  //        color: Colors.white,
                                  //fontFamily: 'Opensans'
                                  //        ),
                                  //  ),
                                  // SizedBox(width: 7.0),
                                  //this should be an iconbutton in a real app.
                                  //   Icon(Icons.arrow_drop_down, color: Colors.white, size: 25.0)
                                ],
                              ),
                            ),
                            Positioned(
                              top: 55.0,
                              left: 20.0,
                              child: Container(
                                width: 220.0,
                                child: Text(place.title,
                                    style: TextStyle(
                                      //  fontFamily: 'Opensans',
                                      fontSize: 30.0,
                                      color: Colors.white,
                                    )),
                              ),
                            ),
                            Positioned(
                                top: 200.0,
                                left: 20.0,
                                child: Row(children: [
                                  Text('',
                                      style: TextStyle(
                                          //       fontFamily: 'Opensans',
                                          fontSize: 30.0,
                                          color: Colors.white)
                                      // fontWeight: FontWeight.w600)
                                      ),
                                  // SizedBox(width: 15.0),
                                  Stack(children: <Widget>[
                                    Container(height: 40.0, width: 100.0),
                                    //Container(
                                    //  height: 60.0,
                                    //  width: 60.0,
                                    //  decoration: BoxDecoration(
                                    //      borderRadius: BorderRadius.circular(100.0),
                                    //  CircleAvatar(
                                    //    backgoundImage:  NetworkImage("https://i.pinimg.com/564x/e3/54/e9/e354e97bf5d17326c3c361d884707e2c.jpg"),
                                    //
                                    Positioned(
                                      left: 10.0,
                                      child: Container(
                                        height: 40.0,
                                        width: 40.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        //      image: DecorationImage(
                                        //    image: NetworkImage(document['chef_img']), fit: BoxFit.cover)),
                                        child: Center(
                                          child: Text('',
                                              style: TextStyle(
                                                  fontSize: 14.0,
                                                  color: Colors.black)),
                                        ),
                                      ),
                                    )
                                  ]),
                                ]))
                          ])));
            }));
  }
}
